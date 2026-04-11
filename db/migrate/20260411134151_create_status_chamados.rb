class CreateStatusChamados < ActiveRecord::Migration[8.1]
  def change
    create_table :status_chamados do |t|
      t.string :nome
      t.boolean :padrao

      t.timestamps
    end
  end
end
