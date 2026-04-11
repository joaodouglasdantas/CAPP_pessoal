class CreateBlocos < ActiveRecord::Migration[8.1]
  def change
    create_table :blocos do |t|
      t.string :nome
      t.integer :quantidade_andares
      t.integer :unidades_por_andar

      t.timestamps
    end
  end
end
