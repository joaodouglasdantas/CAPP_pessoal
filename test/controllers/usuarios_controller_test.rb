require "test_helper"

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @administrador = users(:administrador)
    @colaborador = users(:colaborador)
    @morador = users(:morador)
  end

  test "usuario nao autenticado e redirecionado para login" do
    get usuarios_path
    assert_redirected_to new_user_session_path
  end

  test "administrador pode acessar lista de usuarios" do
    sign_in @administrador
    get usuarios_path
    assert_response :success
  end

  test "colaborador nao pode acessar lista de usuarios" do
    sign_in @colaborador
    get usuarios_path
    assert_redirected_to dashboard_path
  end

  test "morador nao pode acessar lista de usuarios" do
    sign_in @morador
    get usuarios_path
    assert_redirected_to dashboard_path
  end

  test "administrador pode criar usuario" do
    sign_in @administrador
    assert_difference "User.count", 1 do
      post usuarios_path, params: {
        user: {
          nome: "Novo Usuario",
          email: "novo@teste.com",
          password: "123456",
          password_confirmation: "123456"
        },
        papel_id: Papel.find_by(nome: "morador")&.id
      }
    end
  end

  test "administrador pode remover usuario" do
    sign_in @administrador
    assert_difference "User.count", -1 do
      delete usuario_path(@morador)
    end
  end
end
