class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: :create

  def create
    if had_dialog?
      continue_dialog
      redirect_to project_path(@project), notice: '1訊息傳送成功，可至個人聯絡訊息查看'
    else
      start_dialog
      redirect_to project_path(@project), notice: '2訊息傳送成功，可至個人聯絡訊息查看'
    end
  end
  
  private
  
  def had_dialog?
    my_msg = Message.joins(:dialogbox)
                          .where(user: current_user,
                                 dialogboxes: { project: @project })
                          .first
    my_msg.present?
  end

  def continue_dialog
    the_dialogbox = my_msg.dialogbox Message.new()
    the_dialogbox.messages.create(user: current_user, message: params[:message])
  end

  def start_dialog
    dialogbox = @project.dialogboxes.new
    dialogbox.save
    first_msg = Message.new(content: params.values[1].values[1],
                               user: current_user)
    first_msg.save
  end

  def find_project
    @project = Project.find(params.values[1][:project].to_i)
  end
  
  def message_params
    params.require(:message).permit(:content, :user_id, :project_id)
  end
  
end