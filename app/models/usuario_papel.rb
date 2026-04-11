class UsuarioPapel < ApplicationRecord
  belongs_to :usuario, class_name: 'User'
  belongs_to :papel
end