class Admin::MessagesController < ApplicationController
  layout 'admin'
  before_action :set_admin_message, only: [:show, :edit, :update, :destroy]

  # GET /admin/messages
  # GET /admin/messages.json
  def index
    @admin_messages = Admin::Message.all
  end

  # GET /admin/messages/1
  # GET /admin/messages/1.json
  def show
  end

  # GET /admin/messages/new
  def new
    @admin_message = Admin::Message.new
  end

  # GET /admin/messages/1/edit
  def edit
  end

  # POST /admin/messages
  # POST /admin/messages.json
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

  # PATCH/PUT /admin/messages/1
  # PATCH/PUT /admin/messages/1.json
  def update
    respond_to do |format|
      if @admin_message.update(admin_message_params)
        format.html { redirect_to @admin_message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_message }
      else
        format.html { render :edit }
        format.json { render json: @admin_message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/messages/1
  # DELETE /admin/messages/1.json
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
