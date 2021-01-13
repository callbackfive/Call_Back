class DialogboxesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user_projects, only: [:index, :show]
  before_action :set_dialogbox_create_by_current_user, only: [:index, :show]

  def index
  end

  def show
    find_dialogbox
    @dialogbox = Dialogbox.find(params[:id])
    @dialogbox_id = params[:id]
  end

  def create_message
    set_dialogbox_for_creating_message
    continue_dialog
    redirect_to dialogbox_path(@dialogbox), notice: '訊息已送出'  
  end

  private
  def set_current_user_projects
    @my_projects = current_user.projects
  end

  def set_dialogbox_create_by_current_user
    @sent_dialogboxes = current_user.dialogboxes
  end

  def dialogbox_params
    params.require(:dialogbox).permit(:project_id, :user_id, :project_owner_id)
  end

  def find_dialogbox
    # @dialogbox = Dialogbox.find(params.values[2].to_i)
  end

  def set_dialogbox_for_creating_message
    @dialogbox = Dialogbox.find(params.values[1].values[0].to_i)
  end

  def continue_dialog
    @dialogbox.messages.create(user: current_user,
                              content: params.values[1].values[1])
  end

end
