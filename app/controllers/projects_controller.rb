class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project_for_creating_message, only: :create_message


  def index
    @projects = Project.all
  end


  def user_projects
    @user_projects = Project.where(:user_id => current_user.id)
  end

  def show
    @givebacks = @project.givebacks
    @comment = Comment.new
    @comments = @project.comments.includes(:user)
  end

  def new
    @project = Project.new
    @project.givebacks.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to user_projects_path(current_user), notice: '成功新增專案'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path, notice: '提案內容已更新'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to user_projects_path(current_user), notice: '已刪除專案'
  end

  def create_message
    if had_dialog?
      continue_dialog
      redirect_to project_path(@project), notice: '您先前有發送過訊息，可至聯絡訊息，查看此專案的提案人是否已回覆'
    else
      start_dialog
      redirect_to project_path(@project), notice: '您與提案人的已開始新對話，可至聯絡訊息查看'
    end
  end

  private
  def had_dialog?
    @my_msg = Message.joins(:dialogbox)
                     .where(user: current_user, dialogboxes: {project: @project})
                     .first
    byebug
    @my_msg.present?
  end

  def continue_dialog
    dialogbox = @my_msg.dialogbox
    byebug
    dialogbox.messages.create(user: current_user,
                              content: params.values[1].values[1])
    byebug
  end

  def start_dialog
      @dialogbox = @project.dialogboxes.new(user: current_user)
      @dialogbox.save
      first_msg = Message.new(content: params.values[2],
                              user: current_user,
                              dialogbox: @dialogbox)
      first_msg.save
  end
  
  def find_project
    @project = Project.find(params[:id])
  end

  def set_project_for_creating_message
    @project = Project.find(params.values[1].to_i)
    byebug
  end

  def project_params
    params.require(:project).permit(:title, :category, :summary, :content, :image, :target_amount, :user_id, givebacks_attributes: [:id, :title, :price, :deliver_time, :_destroy, :image])
  end
end
