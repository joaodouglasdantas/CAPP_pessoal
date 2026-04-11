class MoradoresUnidade < ApplicationRecord
  belongs_to :unidade
  belongs_to :usuario, class_name: 'User', foreign_key: 'user_id'

  validates :unidade, presence: true
  validates :usuario, presence: true
end