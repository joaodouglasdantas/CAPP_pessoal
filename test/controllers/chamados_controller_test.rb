require "test_helper"

class ChamadosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @administrador = users(:administrador)
    @colaborador = users(:colaborador)
    @morador = users(:morador)

    @status_padrao = StatusChamado.create!(nome: "Aberto", padrao: true)
    @tipo = TipoChamado.create!(titulo: "Manutenção", sla_horas: 24)
    @bloco = Bloco.create!(nome: "Bloco A", quantidade_andares: 2, unidades_por_andar: 2)
    @unidade = @bloco.unidades.first

    MoradoresUnidade.create!(
      unidade: @unidade,
      usuario: @morador,
      assigned_at: Time.current
    )

    @chamado = Chamado.create!(
      unidade: @unidade,
      usuario: @morador,
      tipo_chamado: @tipo,
      descricao: "Teste de chamado"
    )
  end

  test "usuario nao autenticado e redirecionado para login" do
    get chamados_path
    assert_redirected_to new_user_session_path
  end

  test "administrador pode acessar lista de chamados" do
    sign_in @administrador
    get chamados_path
    assert_response :success
  end

  test "colaborador pode acessar lista de chamados" do
    sign_in @colaborador
    get chamados_path
    assert_response :success
  end

  test "morador pode acessar lista de chamados" do
    sign_in @morador
    get chamados_path
    assert_response :success
  end

  test "morador pode criar chamado para sua unidade" do
    sign_in @morador
    assert_difference "Chamado.count", 1 do
      post chamados_path, params: {
        chamado: {
          unidade_id: @unidade.id,
          tipo_chamado_id: @tipo.id,
          descricao: "Novo chamado"
        }
      }
    end
  end

  test "colaborador pode atualizar status do chamado" do
    status_novo = StatusChamado.create!(nome: "Em andamento", padrao: false)
    sign_in @colaborador
    patch chamado_path(@chamado), params: {
      chamado: { status_chamado_id: status_novo.id }
    }
    assert_redirected_to chamado_path(@chamado)
  end

  test "morador nao pode atualizar status do chamado" do
    status_novo = StatusChamado.create!(nome: "Em andamento", padrao: false)
    sign_in @morador
    patch chamado_path(@chamado), params: {
      chamado: { status_chamado_id: status_novo.id }
    }
    assert_redirected_to dashboard_path
  end

  test "administrador pode remover chamado" do
    sign_in @administrador
    assert_difference "Chamado.count", -1 do
      delete chamado_path(@chamado)
    end
  end
end
