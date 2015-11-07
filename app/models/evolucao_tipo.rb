class EvolucaoTipo < ActiveRecord::Base
  has_many :campos, class_name: "EvolucaoCampo"
  accepts_nested_attributes_for :campos, allow_destroy: true

  scope :ativos, -> { where('not inativo') }
end
