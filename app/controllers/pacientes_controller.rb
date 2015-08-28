class PacientesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]

  # GET /pacientes
  # GET /pacientes.json
  def index
    # byebug
    @pacientes = Paciente.order(:nome).page params[:page] unless params[:paciente_filtro]
    @pacientes = Paciente.where("nome ilike ?", "#{params[:paciente_filtro]}%").order(:nome).page params[:page] if params[:paciente_filtro]
  end

  # GET /pacientes/1
  # GET /pacientes/1.json
  def show
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes
  # POST /pacientes.json
  def create
    @paciente = Paciente.new(paciente_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to @paciente, notice: 'Paciente was successfully created.' }
        format.json { render action: 'show', status: :created, location: @paciente }
      else
        format.html { render action: 'new' }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1
  # PATCH/PUT /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params)
        format.html { redirect_to @paciente, notice: 'Paciente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1
  # DELETE /pacientes/1.json
  def destroy
    @paciente.destroy
    respond_to do |format|
      format.html { redirect_to pacientes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paciente
      puts params
      @paciente = Paciente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paciente_params
      params.require(:paciente).permit(:nome, :data_nascimento)
    end
end
