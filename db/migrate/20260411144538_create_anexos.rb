class CreateAnexos < ActiveRecord::Migration[8.1]
  def change
    create_table :anexos do |t|
      t.references :chamado, null: false, foreign_key: true
      t.string :url_arquivo
      t.string :nome_arquivo

      t.timestamps
    end
  end
end
