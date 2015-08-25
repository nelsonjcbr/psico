class IndexEvolucaosPropriedades < ActiveRecord::Migration
  def up
    execute "CREATE INDEX evolocaos_propriedades ON evolucaos USING GIN(propriedades)"
  end
  def down
    execute "DROP INDEX evolocaos_propriedades"
  end
end
