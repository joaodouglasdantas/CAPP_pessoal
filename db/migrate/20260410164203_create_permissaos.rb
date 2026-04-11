class CreatePermissaos < ActiveRecord::Migration[8.1]
  def change
    create_table :permissaos do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
