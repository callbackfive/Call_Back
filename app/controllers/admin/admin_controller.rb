class Admin::AdminController < ApplicationController
  before_action :check_sign_in

  def check_sign_in
    if !user_signed_in?
      redirect_to new_user_session_path, notice: "請先登入！"
    end
  end
end