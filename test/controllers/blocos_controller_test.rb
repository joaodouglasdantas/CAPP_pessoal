require "test_helper"

class BlocosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @administrador = users(:administrador)
    @colaborador = users(:colaborador)
    @morador = users(:morador)
    @bloco = Bloco.create!(nome: "Bloco A", quantidade_andares: 2, unidades_por_andar: 2)
  end

  test "usuario nao autenticado e redirecionado para login" do
    get blocos_path
    assert_redirected_to new_user_session_path
  end

  test "administrador pode acessar lista de blocos" do
    sign_in @administrador
    get blocos_path
    assert_response :success
  end

  test "colaborador nao pode acessar lista de blocos" do
    sign_in @colaborador
    get blocos_path
    assert_redirected_to dashboard_path
  end

  test "morador nao pode acessar lista de blocos" do
    sign_in @morador
    get blocos_path
    assert_redirected_to dashboard_path
  end

  test "administrador pode criar bloco" do
    sign_in @administrador
    assert_difference "Bloco.count", 1 do
      post blocos_path, params: {
        bloco: {
          nome: "Bloco B",
          quantidade_andares: 3,
          unidades_por_andar: 4
        }
      }
    end
  end

  test "administrador pode remover bloco" do
    sign_in @administrador
    assert_difference "Bloco.count", -1 do
      delete bloco_path(@bloco)
    end
  end
end
