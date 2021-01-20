class CommentsController < ActionController::Base
  before_action :authenticate_user!
  before_action :find_project, only: [:new, :create]

  def new
    @comment = current_user.comments.new(parent_id: params[:parent_id])
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.project = @project
    @comment.save

    #一般留言時，通知提案者  
    if @comment.parent_id.nil?
      CommentNotification.with(comment: @comment).deliver_later(@project.user)  
    #提案者回覆時，通知原留言者
    else
      @origin_comment = Comment.find(@comment.parent_id)
      CommentNotification.with(comment: @origin_comment).deliver_later(@origin_comment.user)
    end
    redirect_to project_path(@project)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @comment.project
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end
end
