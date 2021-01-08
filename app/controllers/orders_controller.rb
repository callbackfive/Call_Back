class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_giveback, only: [:show]


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
        # @order = Order.create({
        #   user: current_user,
        #   giveback: @giveback,
        #   project_title: @giveback.project.title,
        #   giveback_title: @giveback.title,
        #   giveback_price: @giveback.price,
          
        #   })
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
          :email
        )
      end
end
