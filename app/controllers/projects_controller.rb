class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update]


  def index
    @projects = Project.all
  end

  def show
  end

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

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to root_path, notice: '提案內容已更新'
    else
      render :edit
    end
  end

  private
  def find_project
    @project = Project.find(params[:id]).order(id: :desc)
  end

  def project_params
    params.require(:project).permit(:title, :category, :summary, :content, :pic, :target_amount, :user_id)
  end
end
