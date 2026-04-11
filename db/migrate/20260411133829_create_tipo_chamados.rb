class CreateTipoChamados < ActiveRecord::Migration[8.1]
  def change
    create_table :tipo_chamados do |t|
      t.string :titulo
      t.integer :sla_horas

      t.timestamps
    end
  end
end
