class StatusChamado < ApplicationRecord
  validates :nome, presence: true
  validates :padrao, uniqueness: { conditions: -> { where(padrao: true) },
            message: "já existe um status padrão definido" }
end