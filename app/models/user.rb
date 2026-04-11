class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :usuario_papeis, class_name: 'UsuarioPapel', foreign_key: 'usuario_id'
  has_many :papeis, through: :usuario_papeis, source: :papel
  has_many :moradores_unidades, class_name: 'MoradoresUnidade', foreign_key: 'user_id'
  has_many :unidades, through: :moradores_unidades

  validates :nome, presence: true

  def tem_papel?(nome_papel)
    papeis.exists?(nome: nome_papel)
  end

  def administrador?
    tem_papel?('administrador')
  end

  def colaborador?
    tem_papel?('colaborador')
  end

  def morador?
    tem_papel?('morador')
  end
end