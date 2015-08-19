class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy], except: [:create]
  layout false, :only => [:show]


  def index
    @users = User.all.order('created_at DESC').page(params[:page]).per(25)
    authorize @users, :index?
  end

  def show
    authorize @user, :show?
  end

  def edit

  end

  def update

    @pass = true
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
      @pass = false
    end

    @result = false

    if  @user.valid_password?(params[:user][:current_password])

      if @pass
        @result = @user.update(:email => params[:user][:email],
                     :password => params[:user][:password],
                     :password_confirmation => params[:user][:password_confirmation])
      else
        @result = @user.update_without_password(:email => params[:user][:email],
                               :password => params[:user][:password],
                               :password_confirmation => params[:user][:password_confirmation])
      end

       #raise ActiveRecord::Rollback
    else
      @user.errors.add(:current_password, 'Password actual incorrecto' )
    end

    @user.save

    respond_to do |format|
      if @result
        format.html { redirect_to users_url, notice: 'Usuario actualizado' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end


  def new
    @user = User.new
  end

  def create

    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user = User.new(:email => params[:user][:email],
                     :password => params[:user][:password],
                     :password_confirmation => params[:user][:password_confirmation])

    @user.save

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_url, notice: 'Usuario creado exitosamente.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    authorize @user, :destroy?
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

end

private
# Use callbacks to share common setup or constraints between actions.
def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:id, :email)
end

