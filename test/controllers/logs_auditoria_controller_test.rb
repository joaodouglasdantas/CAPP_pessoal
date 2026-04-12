require "test_helper"

class LogsAuditoriaControllerTest < ActionDispatch::IntegrationTest
  def setup
    @administrador = users(:administrador)
    @colaborador = users(:colaborador)
    @morador = users(:morador)
  end

  test "usuario nao autenticado e redirecionado para login" do
    get logs_auditoria_path
    assert_redirected_to new_user_session_path
  end

  test "administrador pode acessar auditoria" do
    sign_in @administrador
    get logs_auditoria_path
    assert_response :success
  end

  test "colaborador nao pode acessar auditoria" do
    sign_in @colaborador
    get logs_auditoria_path
    assert_redirected_to dashboard_path
  end

  test "morador nao pode acessar auditoria" do
    sign_in @morador
    get logs_auditoria_path
    assert_redirected_to dashboard_path
  end
end
