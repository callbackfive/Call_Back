class ProjectsController < ApplicationController
  before_action :find_project, only: [:show, :edit, :update, :destroy, :project_givebacks, :favorite, :project_orders_index]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_payment, only: [:project_orders_index]

  def index
    @projects = Project.all
    # @projects = Project.is_now_on_sale 
    @successful_projects = Project.succeeded_and_done
    @past_projects = Project.past_projects
  end

  def user_projects_index
    @user_projects = current_user.projects
  end

  def project_orders_index
    @my_order_lists = @project.orders.order(id: :desc)
    respond_to do |format|
      format.html
      format.csv { send_data @my_order_lists.to_csv_project, filename: "orders-#{Date.today}.csv" }    
    end
  end

  def show
    @givebacks = @project.givebacks
    @comment = Comment.new
    @comments = @project.comments.includes(:user, :replies)
    @message = Message.new
  end

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.new(project_params)
    @project.new_project_validation = true
    if @project.save
      redirect_to edit_project_path(@project)
    else
      render :new
    end
  end

  def edit
    @givebacks = @project.givebacks
    if @project.is_hidden?
      @project.givebacks.new
    end
  end

  def update
    if @project.is_published?
      @project.is_published_project_validation = true
    else
      @project.edit_project_validation = true
    end

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

      MessageNotification.with(message: @new_msg).deliver_later(@project.user) 

      redirect_to project_path(@project), notice: '您先前有發送過訊息，可至聯絡訊息，查看專案負責人是否已回覆'
    else
      start_dialog
      redirect_to project_path(@project), notice: '您與提案人的已開始新對話，可至聯絡訊息查看'
    end
  end

  def project_givebacks
    @givebacks = @project.givebacks
  end

  def favorite
    if current_user.favorite?(@project)
      current_user.my_fav_projects.destroy(@project)
      render json: { status: 'removed' }
    else
      current_user.my_fav_projects << @project
      render json: { status: 'added' }
    end
  end

  def my_favorite
    @my_fav_projects = current_user.my_fav_projects
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
    @new_msg = Message.create(user: current_user,
                              dialogbox: @dialogbox,
                              content: params[:message][:content])
  end

  def start_dialog
    @dialogbox = @project.dialogboxes.new(user: current_user)
    @dialogbox.save
    first_msg = Message.new(content: params[:message][:content],
                              user: current_user,
                              dialogbox: @dialogbox)
    first_msg.save
  end
  
  def find_project
    @project = Project.find(params[:id])
  end

  def find_payment
    @payment = Payment.find(params[:id])
  end

  def set_project_for_creating_message
    @project = Project.find(params[:message][:project])
  end

  def project_params
    params.require(:project).permit(
      :title, 
      :summary, 
      :content, 
      :image, 
      :target_amount, 
      :user_id, 
      :due_date, 
      :status, 
      :category_id, 
      givebacks_attributes: [:id, :title, :price, :deliver_time, :_destroy, :image])
  end
end
