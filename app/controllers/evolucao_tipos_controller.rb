class EvolucaoTiposController < ApplicationController
  before_action :authenticate_user!
  before_action :set_evolucao_tipo, only: [:show, :edit, :update, :destroy]

  # GET /evolucao_tipos
  # GET /evolucao_tipos.json
  def index
    @evolucao_tipos = EvolucaoTipo.all
  end

  # GET /evolucao_tipos/1
  # GET /evolucao_tipos/1.json
  def show
  end

  # GET /evolucao_tipos/new
  def new
    @evolucao_tipo = EvolucaoTipo.new
  end

  # GET /evolucao_tipos/1/edit
  def edit
  end

  # POST /evolucao_tipos
  # POST /evolucao_tipos.json
  def create
    @evolucao_tipo = EvolucaoTipo.new(evolucao_tipo_params)

    respond_to do |format|
      if @evolucao_tipo.save
        format.html { redirect_to @evolucao_tipo, notice: 'Evolucao tipo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @evolucao_tipo }
      else
        format.html { render action: 'new' }
        format.json { render json: @evolucao_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evolucao_tipos/1
  # PATCH/PUT /evolucao_tipos/1.json
  def update
    respond_to do |format|
      if @evolucao_tipo.update(evolucao_tipo_params)
        format.html { redirect_to @evolucao_tipo, notice: 'Evolucao tipo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @evolucao_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evolucao_tipos/1
  # DELETE /evolucao_tipos/1.json
  def destroy
    @evolucao_tipo.destroy
    respond_to do |format|
      format.html { redirect_to evolucao_tipos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evolucao_tipo
      @evolucao_tipo = EvolucaoTipo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evolucao_tipo_params
      params.require(:evolucao_tipo).permit(:nome, :inativo, campos_attributes: [ :id, :nome, :titulo, :requerido, :tipo_campo, :_destroy ])
    end
end
