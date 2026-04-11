class CreateComentarios < ActiveRecord::Migration[8.1]
  def change
    create_table :comentarios do |t|
      t.references :chamado, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.text :mensagem

      t.timestamps
    end
  end
end
