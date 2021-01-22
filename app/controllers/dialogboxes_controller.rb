class DialogboxesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_dialogbox, only: :show
  before_action :set_dialogbox_created_by_current_user, only: [:index, :show]
  before_action :set_current_user_projects, only: [:index, :show]
  before_action :set_dialogbox_created_by_guest, only: [:index, :show]


  def index
  end

  def show
    @dialogbox_id = params[:id]
    @current_user_id = current_user.id
    @messages = Message.where(dialogbox: @dialogbox).includes(:user)

    @project_owner_of_the_dialogbox = @dialogbox.project.user
    @dialogbox_starter = @dialogbox.user
    check_user_in_the_dialogbox
    
    # TODO 訊息左右邊CSS

  end

  def create_message
    set_dialogbox_for_creating_message
    continue_dialog

    SendMessageJob.perform_later(@message)
  end

  private
  def set_dialogbox_created_by_current_user
    @my_sent_dialogboxes = current_user.dialogboxes.includes(:project)
  end

  def set_current_user_projects
    @my_projects = current_user.projects.includes(:dialogboxes)
  end

  def set_dialogbox_created_by_guest
    @dialogboxes_of_my_projects = Dialogbox.where(project: @my_projects).includes(:user, :project)
  end

  def find_dialogbox
    @dialogbox = Dialogbox.find(params[:id])
  end

  def set_dialogbox_for_creating_message
    @msg_dialogbox = Dialogbox.find(params[:message][:dialogbox])
  end

  def continue_dialog
    @message = current_user.messages.create(dialogbox: @msg_dialogbox,
                                            content: params[:message][:content])
  end

  def check_user_in_the_dialogbox
    if @project_owner_of_the_dialogbox != current_user && @dialogbox_starter != current_user
      redirect_to root_path, notice: "你沒有權限進入此聊天室！"
    else
      render :index
    end
  end
end
