class Setor < BancoLegado
  #:extend UpdatableView
  self.table_name = 'setores'
  self.primary_key = 'id'
end
