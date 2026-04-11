class RenameUserIdInUsuarioPapels < ActiveRecord::Migration[8.1]
  def change
    rename_column :usuario_papels, :user_id, :usuario_id
    #feito pois foi cometido um erro no nome do campo e isso acabou quebrando nossas fixtures
  end
end