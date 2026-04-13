class CreateColaboradorTiposChamado < ActiveRecord::Migration[8.1]
  def change
    create_table :colaborador_tipos_chamados do |t|
      t.bigint :user_id
      t.bigint :tipo_chamado_id

      t.timestamps
    end
  end
end
