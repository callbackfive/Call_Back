class DialogboxesController < ApplicationController
  before_action :authenticate_user!

  def index
    @my_dialogboxes = current_user.dialogboxes
    # .includes(:messages)
    @my_projects = current_user.projects
  end

  def show
    @dialogbox_id = params[:id]
  end

  def create_message
    
  end

  private
  def dialogbox_params
    params.require(:dialogbox).permit(:project_id, :user_id, :project_owner_id)
  end

end
