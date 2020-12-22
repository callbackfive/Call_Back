class ProjectsController < ApplicationController

  # def index
  #   @projects = Projects.all
  # end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      redirect_to "/", notice: '成功新增專案'
    else
      render :new
    end
  end


  private
  # def find_project
  #   @project = Project.find(params[:id])
  # end

  def project_params
    params.require(:project).permit(:title, :category, :summary, :content, :pic, :target_amount, :user_id)
  end
end
