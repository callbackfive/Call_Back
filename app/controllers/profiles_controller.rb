class ProfilesController < ApplicationController
  # before_action :find_user, only: [:show]
  before_action :authenticate_user!

  
  def show
  end




  private
  def find_user
    @user = User.find(params[:id])
  end

end
