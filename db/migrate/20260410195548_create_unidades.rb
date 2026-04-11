class CreateUnidades < ActiveRecord::Migration[8.1]
  def change
    create_table :unidades do |t|
      t.references :bloco, null: false, foreign_key: true
      t.integer :numero_andar
      t.integer :numero_unidade
      t.string :identificacao

      t.timestamps
    end
  end
end
