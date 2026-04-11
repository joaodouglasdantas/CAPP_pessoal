class ComentariosController < ApplicationController
  def create
      @chamado = Chamado.find(params[:chamado_id])
      @comentario = Comentario.new(comentario_params)
      @comentario.chamado = @chamado
      @comentario.usuario = current_user

      if @comentario.pode_comentar?
      if @comentario.save
          redirect_to @chamado, notice: "Comentário adicionado."
      else
          redirect_to @chamado, alert: "Erro ao adicionar comentário."
      end
      else
      redirect_to @chamado, alert: "Você não tem permissão para comentar neste chamado."
      end
  end

  private

  def comentario_params
      params.require(:comentario).permit(:mensagem)
  end
end