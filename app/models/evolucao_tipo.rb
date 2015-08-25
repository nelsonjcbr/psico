class EvolucaoTipo < ActiveRecord::Base
  has_many :campos, class_name: "EvolucaoCampo"
  accepts_nested_attributes_for :campos, allow_destroy: true
end
