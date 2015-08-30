class AddInativoToEvolucaoTipo < ActiveRecord::Migration
  def change
    add_column :evolucao_tipos, :inativo, :boolean, :default => false
  end
end
