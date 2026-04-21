class MapaController < ApplicationController
  def index
  end

  def dados
    blocos = Bloco.includes(:unidades).all

    render json: blocos.map { |b|
      {
        id: b.id,
        nome: b.nome,
        quantidade_andares: b.quantidade_andares,
        unidades_por_andar: b.unidades_por_andar
      }
    }
  end
end
