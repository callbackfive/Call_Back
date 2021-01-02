class CommentsController < ActionController::Base
  def create
    @project = Project.find(params[:project_id])
    @comment = current_user.comments.new(comment_params)
    @comment.project = @project
     if @comment.save
       redirect_to project_path(@project)
     end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
