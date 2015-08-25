class CreateEvolucaoCampos < ActiveRecord::Migration
  def change
    create_table :evolucao_campos do |t|
      t.string :nome
      t.string :tipo_campo
      t.string :titulo
      t.boolean :requerido
      t.belongs_to :evolucao_tipo, index: true

      t.timestamps
    end
  end
end
