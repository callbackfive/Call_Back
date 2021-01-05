class TextingsController < ApplicationController
  before_action :find_project, only: [:create]
  before_action :find_project_owner, only: [:create]

  def index
    @textings = Texting.all
  end

  def show
    @texting_id = params[:id]
  end

  def create
    @texting = Texting.new(texting_params)
    @texting.project_id = @project.id
    @texting.user_id = current_user.id
    @texting.project_owner_id = @project_owner.id
  
    if @texting.save
      redirect_to projects_path,
      notice: '訊息已送出，可至個人資料的聯絡訊息確認'
    else
      render 'projects/show'
    end
  end

  private
  def find_project
    @project = Project.find(params.values[1][:project])
  end

  def find_project_owner
    @project_owner = User.find(params.values[1][:user].to_i)
  end

  def texting_params
    params.require(:texting).permit(:project_id, :user_id, :project_owner_id)
  end

end
