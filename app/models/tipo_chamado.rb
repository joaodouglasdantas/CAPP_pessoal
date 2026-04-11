class TipoChamado < ApplicationRecord
  validates :titulo, presence: true
  validates :sla_horas, presence: true, numericality: { greater_than: 0 }
end