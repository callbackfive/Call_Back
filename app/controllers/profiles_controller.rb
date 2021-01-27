class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @my_fav_projects = current_user.my_fav_projects
<<<<<<< HEAD
    @user_projects = current_user.projects
=======
>>>>>>> 5aabe52 ( 完成贊助清單)
    @q = Order.ransack(params[:q])
    @orders = current_user.orders
    @q = Order.ransack(params[:q])
    @user_orders = @q.result
    # @user_orders = Order.where(:user_id => current_user.id).order(id: :desc)
    respond_to do |format|
      format.html
      format.csv { send_data @orders.to_csv, filename: "orders-#{Date.today}.csv" }
      
    end
  end

end
