class DashboardController < ApplicationController
  def index
    if current_user.administrador?
      @blocos = Bloco.all
      @chamados = Chamado.all
      @usuarios = User.all
    elsif current_user.colaborador?
      @chamados = Chamado.all
    elsif current_user.morador?
      @chamados = Chamado.joins(unidade: :moradores_unidades)
                         .where(moradores_unidades: { user_id: current_user.id })
    end
  end
end