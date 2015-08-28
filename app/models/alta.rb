class Alta < BancoLegado
  #:extend UpdatableView
  self.table_name = 'altas'
  self.primary_key = 'intern_id'

  belongs_to :intern

  default_scope where('data_alta notnull')  
end
