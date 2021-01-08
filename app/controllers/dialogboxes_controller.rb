class DialogboxesController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_dialogboxes = current_user.dialogboxes
  end

  def show
    @dialogbox_id = params[:id]
  end

  private
  def dialogbox_params
    params.require(:dialogbox).permit(:project_id, :user_id, :project_owner_id)
  end

end
