class CreateUsuarioPapels < ActiveRecord::Migration[8.1]
  def change
    create_table :usuario_papels do |t|
      t.references :user, null: false, foreign_key: true
      t.references :papel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
