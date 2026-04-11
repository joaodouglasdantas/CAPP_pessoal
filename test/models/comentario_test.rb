require "test_helper"

class ComentarioTest < ActiveSupport::TestCase
  def setup
    @status_padrao = StatusChamado.create!(nome: "Aberto", padrao: true)
    @tipo = TipoChamado.create!(titulo: "Manutenção", sla_horas: 24)
    @bloco = Bloco.create!(nome: "Bloco A", quantidade_andares: 2, unidades_por_andar: 2)
    @unidade = @bloco.unidades.first
    @morador = users(:morador)
    @administrador = users(:administrador)

    MoradoresUnidade.create!(unidade: @unidade, usuario: @morador, assigned_at: Time.current)

    @chamado = Chamado.create!(
      unidade: @unidade,
      usuario: @morador,
      tipo_chamado: @tipo,
      descricao: "Torneira com vazamento"
    )
  end

  test "deve ser inválido sem mensagem" do
    comentario = Comentario.new(chamado: @chamado, usuario: @morador)
    assert_not comentario.valid?
  end

  test "deve ser inválido sem chamado" do
    comentario = Comentario.new(usuario: @morador, mensagem: "Teste")
    assert_not comentario.valid?
  end

  test "deve ser inválido sem usuario" do
    comentario = Comentario.new(chamado: @chamado, mensagem: "Teste")
    assert_not comentario.valid?
  end

  test "morador pode comentar no seu proprio chamado" do
    comentario = Comentario.new(
      chamado: @chamado,
      usuario: @morador,
      mensagem: "Vou verificar amanhã"
    )
    assert comentario.pode_comentar?
  end

  test "morador nao pode comentar em chamado de outra unidade" do
    outro_morador = users(:morador_dois)
    comentario = Comentario.new(
      chamado: @chamado,
      usuario: outro_morador,
      mensagem: "Comentário indevido"
    )
    assert_not comentario.pode_comentar?
  end

  test "administrador pode comentar em qualquer chamado" do
    comentario = Comentario.new(
      chamado: @chamado,
      usuario: @administrador,
      mensagem: "Vamos resolver isso"
    )
    assert comentario.pode_comentar?
  end
end