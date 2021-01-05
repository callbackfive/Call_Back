class DialogboxesController < ApplicationController
  before_action :find_project, only: [:create]
  before_action :find_project_owner, only: [:create]

  def index
    @dialogboxes = Dialogbox.all
  end

  def show
    @dialogbox_id = params[:id]
  end

  def create
    @dialogbox = Dialogbox.new(dialogbox_params)
    @dialogbox.project_id = @project.id
    @dialogbox.user_id = current_user.id
    @dialogbox.project_owner_id = @project_owner.id
  
    if @dialogbox.save
      redirect_to projects_path,
      notice: '訊息已送出，可至個人資料的聯絡訊息確認'
    else
      render 'projects/show'
    end
  end

  private
  def find_project
    @project = Project.find(params.values[1][:project].to_i)
  end

  def find_project_owner
    @project_owner = User.find(params.values[1][:user].to_i)
  end

  def dialogbox_params
    params.require(:dialogbox).permit(:project_id, :user_id, :project_owner_id)
  end

end
