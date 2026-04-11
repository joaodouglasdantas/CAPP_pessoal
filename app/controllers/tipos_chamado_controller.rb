class TiposChamadoController < ApplicationController
  before_action :apenas_administrador!
  before_action :set_tipo_chamado, only: [:edit, :update, :destroy]

  def index
    @tipos_chamado = TipoChamado.all
  end

  def new
    @tipo_chamado = TipoChamado.new
  end

  def create
    @tipo_chamado = TipoChamado.new(tipo_chamado_params)
    if @tipo_chamado.save
      redirect_to tipos_chamado_index_path, notice: "Tipo criado com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @tipo_chamado.update(tipo_chamado_params)
      redirect_to tipos_chamado_index_path, notice: "Tipo atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @tipo_chamado.destroy
    redirect_to tipos_chamado_index_path, notice: "Tipo removido com sucesso."
  end

  private

  def set_tipo_chamado
    @tipo_chamado = TipoChamado.find(params[:id])
  end

  def tipo_chamado_params
    params.require(:tipo_chamado).permit(:titulo, :sla_horas)
  end
end