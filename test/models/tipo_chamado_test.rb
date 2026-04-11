require "test_helper"

class TipoChamadoTest < ActiveSupport::TestCase
  test "deve ser inválido sem titulo" do
    tipo = TipoChamado.new(sla_horas: 24)
    assert_not tipo.valid?
  end

  test "deve ser inválido sem sla_horas" do
    tipo = TipoChamado.new(titulo: "Manutenção")
    assert_not tipo.valid?
  end

  test "deve ser inválido com sla_horas menor que 1" do
    tipo = TipoChamado.new(titulo: "Manutenção", sla_horas: 0)
    assert_not tipo.valid?
  end
end