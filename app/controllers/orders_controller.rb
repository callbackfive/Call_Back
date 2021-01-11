class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_giveback, only: [:show, :edit, :update, :destroy]

    def index
      @orders = current_user.orders
      @user_orders = Order.where(:user_id => current_user.id)
    end

    def show
      @order = Order.new
    end

    def create
      @giveback = Giveback.find(order_params[:giveback_id])
      @project = @giveback.project
      @order = Order.new(order_params)
      @order.assign_attributes(
        user: current_user,
        project_title: @project.title,
        giveback_title: @giveback.title,
        giveback_price: @giveback.price,
      )
      if @order.save
        redirect_to mpg_payments_path(order_id: @order.id)
      else
        render :show
      end
    end  

    private
    def find_giveback
        @giveback = Giveback.find(params[:id])
    end


      def find_project
        @project = Project.find(params[:id])
      end

      def order_params
        params.permit(
          :giveback_id,
          :full_name,
          :delivery_country,
          :address,
          :phone,
          :email,
          :zip
        )
      end
end
