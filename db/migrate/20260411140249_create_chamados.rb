class CreateChamados < ActiveRecord::Migration[8.1]
  def change
    create_table :chamados do |t|
      t.references :unidade, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :tipo_chamado, null: false, foreign_key: true
      t.references :status_chamado, null: false, foreign_key: true
      t.text :descricao
      t.datetime :finalizado_em

      t.timestamps
    end
  end
end
