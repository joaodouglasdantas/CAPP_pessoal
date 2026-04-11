class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def apenas_administrador!
    redirect_to dashboard_path, alert: "Acesso negado." unless current_user.administrador?
  end

  def apenas_administrador_ou_colaborador!
    redirect_to dashboard_path, alert: "Acesso negado." unless current_user.administrador? || current_user.colaborador?
  end
end