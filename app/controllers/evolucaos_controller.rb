class EvolucaosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_evolucao, only: [:show, :edit, :update, :destroy]
  autocomplete :paciente, :nome
  
  # GET /evolucaos
  # GET /evolucaos.json
  def index
#    byebug
    @paciente = Paciente.find(params[:paciente]) if params[:paciente]
    @evolucaos = Evolucao.all unless params[:paciente]
    @evolucaos = Evolucao.where(paciente_id: params[:paciente] ) if params[:paciente]
  end

  # GET /evolucaos/1
  # GET /evolucaos/1.json
  def show
    respond_to do |format|
      format.html

      format.pdf { render pdf: "evolucao-report", encoding: "utf-8",
        footer: { center: "[page] of [topage]" }
      }
    end
  end

  # GET /evolucaos/new
  def new
    @evolucao = Evolucao.new(evolucao_tipo_id: params[:evolucao_tipo_id], paciente_id: params[:paciente_id])
    @paciente = Paciente.find(params[:paciente_id])
    @evolucao.data = Date.today
  end

  # GET /evolucaos/1/edit
  def edit
  end

  # POST /evolucaos
  # POST /evolucaos.json
  def create
    @evolucao = Evolucao.new(evolucao_params)

    respond_to do |format|
      if @evolucao.save
        format.html { redirect_to @evolucao, notice: 'Evolucao was successfully created.' }
        format.json { render action: 'show', status: :created, location: @evolucao }
      else
        format.html { render action: 'new' }
        format.json { render json: @evolucao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evolucaos/1
  # PATCH/PUT /evolucaos/1.json
  def update
    respond_to do |format|
      if @evolucao.update(evolucao_params)
        format.html { redirect_to @evolucao, notice: 'Evolucao was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @evolucao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evolucaos/1
  # DELETE /evolucaos/1.json
  def destroy
    @evolucao.destroy
    respond_to do |format|
      format.html { redirect_to evolucaos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evolucao
      @evolucao = Evolucao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evolucao_params
      params.require(:evolucao).permit(:paciente_id, :evolucao_tipo_id, :data).tap do |while_listed|
        while_listed[:propriedades] = params[:evolucao][:propriedades]
      end
    end
end
