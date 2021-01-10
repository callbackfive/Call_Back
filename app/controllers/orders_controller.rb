class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_giveback, only: [:show, :edit, :update, :destroy]


      def show
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
      # byebug
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


end
