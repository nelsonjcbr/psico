class Intern < BancoLegado
  #:extend UpdatableView
  self.table_name = 'interns'
  self.primary_key = 'id'

 #scope :dry_clean_only, -> { joins(:washing_instructions).where('washing_instructions.dry_clean_only = ?', true) }
  scope :internados, joins("left join altas on altas.intern_id=interns.id").
    where("interns.tipopac_id=1 and altas.data_alta is null")

end
