#class Paciente < ActiveRecord::Base
class Paciente < BancoLegado
  #:extend UpdatableView
  self.table_name = 'pacientes'
  self.primary_key = 'id'
end
