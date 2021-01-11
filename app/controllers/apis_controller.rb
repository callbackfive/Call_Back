class ApisController < ActionController::Base
 
  def projects
    @projects = Project.all
    render json:@projects
  end

end