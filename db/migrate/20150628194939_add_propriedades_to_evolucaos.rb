class AddPropriedadesToEvolucaos < ActiveRecord::Migration
  def change
    add_column :evolucaos, :propriedades, :hstore
  end
end
