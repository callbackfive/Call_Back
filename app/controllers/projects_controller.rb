class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy, :project_givebacks]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @projects = Project.is_now_on_sale 
    @successful_projects = Project.succeeded_and_done
    @past_projects = Project.past_projects
  end

  def user_projects_index
    @user_projects = current_user.projects
  end

  def show
    @givebacks = @project.givebacks
    @comment = Comment.new
    @comments = @project.comments.includes(:user)
    @message = Message.new
  end

  def new
    @project = Project.new
    @project.givebacks.new
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to edit_project_path(@project)
    else
      render :new
    end
  end

  def edit
    # redirect_to user_projects_path(current_user), notice: '成功新增專案'
  end

  def update
    if @project.update(project_params)
      redirect_to project_path, notice: '提案內容已更新'
      @project.is_published!
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to user_projects_path(current_user), notice: '已刪除專案'
  end

  def create_message
    set_project_for_creating_message
    if had_dialog?
      continue_dialog
      redirect_to project_path(@project), notice: '您先前有發送過訊息，可至聯絡訊息，查看專案負責人是否已回覆'
    else
      start_dialog
      redirect_to project_path(@project), notice: '您與提案人的已開始新對話，可至聯絡訊息查看'
    end
  end

  def project_givebacks
    @givebacks = @project.givebacks
  end

  private
  def had_dialog?
    @my_msg = Message.joins(:dialogbox)
                     .where(user: current_user, dialogboxes: {project: @project})
                     .first
    @my_msg.present?
  end

  def continue_dialog
    @dialogbox = @my_msg.dialogbox
    @dialogbox.messages.create(user: current_user,
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
  
  def find_project
    @project = Project.find(params[:id])
  end

  def set_project_for_creating_message
    @project = Project.find(params.values[1].values[0].to_i)
  end

  def project_params
    params.require(:project).permit(:title, :summary, :content, :image, :target_amount, :user_id, :due_date, :status, :category_id, givebacks_attributes: [:id, :title, :price, :deliver_time, :_destroy, :image])
  end
end
