class PapelPermissao < ApplicationRecord
  belongs_to :papel
  belongs_to :permissao
end
