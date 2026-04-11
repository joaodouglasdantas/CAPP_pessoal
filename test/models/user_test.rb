require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "deve ser inválido sem nome" do
    user = User.new(email: "teste@email.com", password: "123456")
    assert_not user.valid?
  end

  test "deve ser inválido sem email" do
    user = User.new(nome: "João", password: "123456")
    assert_not user.valid?
  end

  test "deve reconhecer papel de administrador" do
    user = users(:administrador)
    assert user.administrador?
    assert_not user.colaborador?
    assert_not user.morador?
  end
end