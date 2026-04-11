class CreatePapels < ActiveRecord::Migration[8.1]
  def change
    create_table :papels do |t|
      t.string :nome
      t.string :descricao

      t.timestamps
    end
  end
end
