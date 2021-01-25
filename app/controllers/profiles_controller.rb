class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @my_fav_projects = current_user.my_fav_projects
  end

end
