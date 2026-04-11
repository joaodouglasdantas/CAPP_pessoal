class CreatePapelPermissaos < ActiveRecord::Migration[8.1]
  def change
    create_table :papel_permissaos do |t|
      t.references :papel, null: false, foreign_key: true
      t.references :permissao, null: false, foreign_key: true

      t.timestamps
    end
  end
end
