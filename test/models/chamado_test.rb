require "test_helper"

class ChamadoTest < ActiveSupport::TestCase
  def setup
    @status_padrao = StatusChamado.create!(nome: "Aberto", padrao: true)
    @status_concluido = StatusChamado.create!(nome: "Concluído", padrao: false)
    @tipo = TipoChamado.create!(titulo: "Manutenção", sla_horas: 24)
    @bloco = Bloco.create!(nome: "Bloco A", quantidade_andares: 2, unidades_por_andar: 2)
    @unidade = @bloco.unidades.first
    @usuario = users(:morador)
  end

  test "deve ser inválido sem descrição" do
    chamado = Chamado.new(unidade: @unidade, usuario: @usuario, tipo_chamado: @tipo)
    assert_not chamado.valid?
  end

  test "deve iniciar com status padrão automaticamente" do
    chamado = Chamado.create!(
      unidade: @unidade,
      usuario: @usuario,
      tipo_chamado: @tipo,
      descricao: "Torneira com vazamento"
    )
    assert_equal @status_padrao, chamado.status_chamado
  end

  test "deve registrar finalizado_em ao ser concluído" do
    chamado = Chamado.create!(
      unidade: @unidade,
      usuario: @usuario,
      tipo_chamado: @tipo,
      descricao: "Torneira com vazamento"
    )
    assert_nil chamado.finalizado_em
    chamado.update!(status_chamado: @status_concluido)
    assert_not_nil chamado.finalizado_em
  end

  test "deve ser inválido sem unidade" do
    chamado = Chamado.new(usuario: @usuario, tipo_chamado: @tipo, descricao: "Teste")
    assert_not chamado.valid?
  end

  test "deve ser inválido sem tipo de chamado" do
    chamado = Chamado.new(unidade: @unidade, usuario: @usuario, descricao: "Teste")
    assert_not chamado.valid?
  end
end