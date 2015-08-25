class BancoLegado < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "banco_legado"
end
