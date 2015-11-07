class EvolucaoCampo < ActiveRecord::Base
  belongs_to :evolucao_tipo
  default_scope -> { order(:nome) }
end
