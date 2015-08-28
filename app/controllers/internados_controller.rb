class InternadosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_paciente, only: [:show, :edit, :update, :destroy]


  def index
#    @internados = Intern.select('interns.i nome_paciente', :setor_id, 'setores.nome as nome_setor').joins('left join pacientes on pacientes.id=interns.paciente_id left join setores on setores.id=interns.setor_id').internados
    @internados = Intern.select('interns.id, interns.data_entrada, paciente_id, pacientes.nome as nome_paciente', :setor_id, 'setores.nome as nome_setor').
      joins('left join pacientes on pacientes.id=interns.paciente_id left join setores on setores.id=interns.setor_id left join altas on altas.intern_id=interns.id').
      where("interns.tipopac_id=1 and altas.data_alta is null").
      order('6,4')
#    byebug
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
