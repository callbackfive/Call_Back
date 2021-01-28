class Admin::MessagesController < ApplicationController
  layout 'admin'
  before_action :set_admin_message, only: [:show, :edit, :update, :destroy]

  def index
    @admin_messages = Admin::Message.all
  end

  
  def new
    @admin_message = Admin::Message.new
  end

  def create
    @admin_message = Admin::Message.new(admin_message_params)

    respond_to do |format|
      if @admin_message.save
        format.html { redirect_to @admin_message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @admin_message }
      else
        format.html { render :new }
        format.json { render json: @admin_message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin_message.destroy
    respond_to do |format|
      format.html { redirect_to admin_messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_message
      @admin_message = Admin::Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_message_params
      params.fetch(:admin_message, {})
    end
end
