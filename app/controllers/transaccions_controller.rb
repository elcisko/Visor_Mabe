class TransaccionsController < ApplicationController
  before_action :set_transaccion, only: [:show, :edit, :update, :destroy]
  has_scope :batch_id, :external_id, allow_blank: false, only: :index
  layout false, :only => [:detalle, :payload]

  # GET /transaccions
  # GET /transaccions.json
  def index

    @default_order = 'desc'
    @por_pag = 25
    order_by = ''
    if !params[:cantidad].present?
      @cantidad = 100
    elsif
    @cantidad =params[:cantidad]
    end

    #columna y tipo de ordenamiento
    if params.has_key?("sort_column")and !params[:sort_column].empty?
      order_by = "#{params[:sort_column]} #{params[:sort_order]}"
      @default_order = params[:sort_order] == 'desc' ? 'asc' : 'desc'
    end

    @transaccions = apply_scopes(Transaccion).limit(@cantidad).select('distinct batch_id, status, tipo_transaccion').order(order_by).page(params[:page]).per(@por_pag)
    @count = apply_scopes(Transaccion).count('distinct batch_id')

    if @count.to_i > @cantidad.to_i

      @total_pages = @cantidad.to_i / @por_pag

    elsif @count.to_i < @por_pag

      @total_pages = 1
    else
      @res = redondear(@count.to_f / @por_pag)
      @total_pages = @res.to_i
    end

    #puts @transaccions.size
    #total de la pagina
    #puts @transaccions.count
    # pagina que se va a mostar
    #puts @transaccions.current_page
    #cantidad de resultados encontrados
    #puts @count


      url_for(params.except(:obsolete_param_name))
  end

  def detalle

    @batch_id = params[:id]

    @transaccions = Transaccion.where(batch_id: params[:id])

  end

  def payload

    @transaccion = Transaccion.find(params[:id])

  end

  # GET /transaccions/1
  # GET /transaccions/1.json
  def show
  end

  # GET /transaccions/new
  def new
    @transaccion = Transaccion.new
  end

  # GET /transaccions/1/edit
  def edit
  end

  # POST /transaccions
  # POST /transaccions.json
  def create
    @transaccion = Transaccion.new(transaccion_params)

    respond_to do |format|
      if @transaccion.save
        format.html { redirect_to @transaccion, notice: 'Transaccion was successfully created.' }
        format.json { render :show, status: :created, location: @transaccion }
      else
        format.html { render :new }
        format.json { render json: @transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaccions/1
  # PATCH/PUT /transaccions/1.json
  def update
    respond_to do |format|
      if @transaccion.update(transaccion_params)
        format.html { redirect_to @transaccion, notice: 'Transaccion was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaccion }
      else
        format.html { render :edit }
        format.json { render json: @transaccion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaccions/1
  # DELETE /transaccions/1.json
  def destroy
    @transaccion.destroy
    respond_to do |format|
      format.html { redirect_to transaccions_url, notice: 'Transaccion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaccion
      @transaccion = Transaccion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaccion_params
      params.require(:transaccion).permit(:id, :external_id, :record_id, :batch_id, :payload, :ejecucion, :status, :tipo_transaccion, :source_id, :target_id)
    end

    # 3.5 se redondeará a 4 pero 3.4 se redondeará a 4
    def redondear(num)
      base = num.floor
      fraction = num - base
      if fraction > 0
        base+1
      else
        num.round
      end
    end
end
