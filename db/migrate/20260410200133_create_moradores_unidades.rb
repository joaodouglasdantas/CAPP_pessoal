class CreateMoradoresUnidades < ActiveRecord::Migration[8.1]
  def change
    create_table :moradores_unidades do |t|
      t.references :unidade, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :assigned_at
      t.bigint :assigned_by_id

      t.timestamps
    end
  end
end
