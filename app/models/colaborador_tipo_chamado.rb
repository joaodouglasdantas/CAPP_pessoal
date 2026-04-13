class ColaboradorTipoChamado < ApplicationRecord
  self.table_name = "colaborador_tipos_chamados"

  belongs_to :user
  belongs_to :tipo_chamado

  validates :user_id, uniqueness: { scope: :tipo_chamado_id, message: "já possui esse tipo de chamado" }
end
