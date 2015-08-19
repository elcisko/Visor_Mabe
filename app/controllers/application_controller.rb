class ApplicationController < ActionController::Base

  layout :layout_by_resource

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #agregado para el uso de pundit
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Globally rescue Authorization Errors in controller.
  # Returning 403 Forbidden if permission is denied
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  # Enforces access right checks for individuals resources
  # after_filter :verify_authorized, :except => :index

  # Enforces access right checks for collections
  # after_filter :verify_policy_scoped, :only => :index

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def layout_by_resource
    if devise_controller?
      "application"
    else
      "application"
    end
  end


  private

  def permission_denied
    flash[:alert] = "Permiso denegado para ingresar en esta opcion"
    redirect_to(request.referrer || root_path)
  end

  def user_not_authorized
    flash[:alert] = "No esta autorizado para ingresar en esta opcion"
    redirect_to(request.referrer || root_path)
  end
end
