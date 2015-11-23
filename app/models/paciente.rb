#class Paciente < ActiveRecord::Base
class Paciente < BancoLegado
  #:extend UpdatableView
  self.table_name = 'pacientes'
  self.primary_key = 'id'

  has_many :evolucaos

  def nome_e_id
    self.nome + '(' + self.id.to_s + ')'
  end

end
