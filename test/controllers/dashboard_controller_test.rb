require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  def setup
    @administrador = users(:administrador)
  end

  test "usuario nao autenticado e redirecionado para login" do
    get dashboard_path
    assert_redirected_to new_user_session_path
  end

  test "usuario autenticado pode acessar dashboard" do
    sign_in @administrador
    get dashboard_path
    assert_response :success
  end
end
