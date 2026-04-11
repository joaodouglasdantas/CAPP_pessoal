require "test_helper"

class StatusChamadoTest < ActiveSupport::TestCase
  test "deve ser inválido sem nome" do
    status = StatusChamado.new
    assert_not status.valid?
  end

  test "deve existir apenas um status padrão" do
    StatusChamado.create!(nome: "Aberto", padrao: true)
    status_duplicado = StatusChamado.new(nome: "Novo", padrao: true)
    assert_not status_duplicado.valid?
  end
end