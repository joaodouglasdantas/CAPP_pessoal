require "test_helper"

class LogAuditoriumTest < ActiveSupport::TestCase
  def setup
    @administrador = users(:administrador)
  end

  test "deve criar log ao criar um bloco" do
    assert_difference "LogAuditorium.count", 1 do
      Bloco.create!(nome: "Bloco Teste", quantidade_andares: 2, unidades_por_andar: 2)
    end
  end

  test "deve criar log ao atualizar um bloco" do
    bloco = Bloco.create!(nome: "Bloco Teste", quantidade_andares: 2, unidades_por_andar: 2)
    assert_difference "LogAuditorium.count", 1 do
      bloco.update!(nome: "Bloco Atualizado")
    end
  end

  test "deve criar log ao remover um bloco" do
    bloco = Bloco.create!(nome: "Bloco Teste", quantidade_andares: 2, unidades_por_andar: 2)
    assert_difference "LogAuditorium.count", 1 do
      bloco.destroy
    end
  end

  test "deve criar log ao criar um usuario" do
    assert_difference "LogAuditorium.count", 1 do
      User.create!(nome: "Novo Usuario", email: "novo@teste.com", password: "123456")
    end
  end

  test "deve criar log ao remover um usuario" do
    usuario = User.create!(nome: "Novo Usuario", email: "novo@teste.com", password: "123456")
    assert_difference "LogAuditorium.count", 1 do
      usuario.destroy
    end
  end

  test "registrar deve criar log com usuario e acao" do
    log = LogAuditorium.registrar(@administrador, "Ação de teste")
    assert_equal @administrador.id, log.usuario_id
    assert_equal "Ação de teste", log.acao
  end

  test "registrar deve criar log sem usuario quando nil" do
    log = LogAuditorium.registrar(nil, "Ação do sistema")
    assert_nil log.usuario_id
    assert_equal "Ação do sistema", log.acao
  end
end
