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
    set_dialogbox
    continue_dialog
    redirect_to dialogbox_path(@dialogbox), notice: '訊息已送出'  
  end

  private
  def dialogbox_params
    params.require(:dialogbox).permit(:project_id, :user_id, :project_owner_id)
  end

  def set_dialogbox
    @dialogbox = Dialogbox.find(params.values[1].values[0].to_i)
  end

  def continue_dialog
    @dialogbox.messages.create(user: current_user,
                              content: params.values[1].values[1])
  end

end
