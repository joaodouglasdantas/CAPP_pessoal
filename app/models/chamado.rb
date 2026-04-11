class Chamado < ApplicationRecord
  belongs_to :unidade
  belongs_to :usuario, class_name: 'User', foreign_key: 'user_id'
  belongs_to :tipo_chamado
  belongs_to :status_chamado, optional: true

  validates :descricao, presence: true
  validates :unidade, presence: true
  validates :tipo_chamado, presence: true
  validates :status_chamado, presence: true, on: :update

  before_create :definir_status_padrao
  before_update :registrar_finalizacao

  private

  def definir_status_padrao
    self.status_chamado ||= StatusChamado.find_by(padrao: true)
  end

  def registrar_finalizacao
    if status_chamado_id_changed? && status_chamado.nome.downcase == "concluído"
      self.finalizado_em = Time.current
    end
  end
end