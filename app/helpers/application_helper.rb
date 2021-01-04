module ApplicationHelper
  def project_owner?
    current_user == @project.user
  end
end
