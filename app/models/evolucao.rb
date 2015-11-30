class Evolucao < ActiveRecord::Base
  #serialize :propriedades, ActiveRecord::Coders::Hstore
  store_accessor :propriedades
  belongs_to :paciente
  belongs_to :evolucao_tipo
  #serialize :properties, Hash
  scope :todas, -> { joins(:evolucao_tipo).where('nome <> ? ', 'Evolução') }
end
