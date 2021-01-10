class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project_for_message, only: :create

  def index
    @messages = Message.all
    # User.includes(:posts).where(posts: { name: 'example' })
  end

  private
  def had_dialog?
    @my_msg = Message.joins(:dialogbox)
                     .where(user: current_user, dialogboxes: {project: @project})
                     .first
    @my_msg.present?
  end

  def continue_dialog
    dialogbox = @my_msg.dialogbox
    dialogbox.messages.create(user: current_user,
                              content: params.values[1].values[1])
  end

  def start_dialog
      @dialogbox = @project.dialogboxes.new(user: current_user)
      @dialogbox.save
      first_msg = Message.new(content: params.values[1].values[1],
                              user: current_user,
                              dialogbox: @dialogbox)
      first_msg.save
  end

  def set_project_for_message
    @project = Project.find(params.values[1].values[0])
  end
  
  def message_params
    params.require(:message).permit(:content, :user_id, :project_id)
  end
  
end