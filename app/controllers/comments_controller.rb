class CommentsController < ActionController::Base
  before_action :authenticate_user!
  before_action :find_project, only: [:new, :create]

  def new
    @comment = current_user.comments.new(parent_id: params[:parent_id])
  end
  
  def create
    @comment = current_user.comments.new(comment_params)
    @comment.project = @project
     if @comment.save 
       redirect_to project_path(@project)
     end
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
