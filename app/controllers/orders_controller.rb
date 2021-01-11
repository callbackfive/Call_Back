class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_giveback, only: [:show, :edit, :update, :destroy]



    private
    def find_giveback
        @giveback = Giveback.find(params[:id])
    end


end
