class Admin::NotificationsController < ApplicationController
  layout "admin"
  before_action :set_admin_notification, only: [:show, :edit, :update, :destroy]

  # GET /admin/notifications
  # GET /admin/notifications.json
  def index
    @q = Admin::Notification.ransack(params[:q])
    @admin_notifications = @q.result
  end

  # GET /admin/notifications/1
  # GET /admin/notifications/1.json
  def show
  end

  # GET /admin/notifications/new
  def new
    @admin_notification = Admin::Notification.new
  end

  # GET /admin/notifications/1/edit
  def edit
  end

  # POST /admin/notifications
  # POST /admin/notifications.json
  def create
    @admin_notification = Admin::Notification.new(admin_notification_params)

    respond_to do |format|
      if @admin_notification.save
        format.html { redirect_to @admin_notification, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @admin_notification }
      else
        format.html { render :new }
        format.json { render json: @admin_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/notifications/1
  # PATCH/PUT /admin/notifications/1.json
  def update
    respond_to do |format|
      if @admin_notification.update(admin_notification_params)
        format.html { redirect_to @admin_notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_notification }
      else
        format.html { render :edit }
        format.json { render json: @admin_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/notifications/1
  # DELETE /admin/notifications/1.json
  def destroy
    @admin_notification.destroy
    respond_to do |format|
      format.html { redirect_to admin_notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_notification
      @admin_notification = Admin::Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_notification_params
      params.fetch(:admin_notification, {})
    end
end
