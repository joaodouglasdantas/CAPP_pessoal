class Unidade < ApplicationRecord
  belongs_to :bloco
  has_many :moradores_unidades, dependent: :destroy
  has_many :moradores, through: :moradores_unidades, source: :usuario
  has_many :chamados, dependent: :destroy

  validates :numero_andar, presence: true
  validates :numero_unidade, presence: true
  validates :identificacao, presence: true
end
