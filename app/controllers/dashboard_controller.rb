class DashboardController < ApplicationController
  def index
    if current_user.administrador?
      @blocos = Bloco.all
      @chamados = Chamado.all
      @usuarios = User.all
    elsif current_user.colaborador?
      tipos_ids = current_user.tipos_chamado_responsavel.pluck(:id)
      @chamados = Chamado.where(tipo_chamado_id: tipos_ids)
    elsif current_user.morador?
      @chamados = Chamado.joins(unidade: :moradores_unidades)
                         .where(moradores_unidades: { user_id: current_user.id })
    end
  end
end
