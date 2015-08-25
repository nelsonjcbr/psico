class CreateEvolucaos < ActiveRecord::Migration
  def change
    create_table :evolucaos do |t|
      t.references :paciente, index: true
      t.date :data
      t.integer :evolucao_tipo_id

      t.timestamps
    end
  end
end
