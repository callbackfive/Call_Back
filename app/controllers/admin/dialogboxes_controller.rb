class Admin::DialogboxesController < ApplicationController
  layout 'admin'

  before_action :set_admin_dialogbox, only: [:show, :edit, :update, :destroy]

  def index
    @admin_dialogboxes = Admin::Dialogbox.all
  end

  # GET /admin/dialogboxes/1
  # GET /admin/dialogboxes/1.json
  def show
  end

  # GET /admin/dialogboxes/new
  def new
    @admin_dialogbox = Admin::Dialogbox.new
  end

  # GET /admin/dialogboxes/1/edit
  def edit
  end

  # POST /admin/dialogboxes
  # POST /admin/dialogboxes.json
  def create
    @admin_dialogbox = Admin::Dialogbox.new(admin_dialogbox_params)

    respond_to do |format|
      if @admin_dialogbox.save
        format.html { redirect_to @admin_dialogbox, notice: 'Dialogbox was successfully created.' }
        format.json { render :show, status: :created, location: @admin_dialogbox }
      else
        format.html { render :new }
        format.json { render json: @admin_dialogbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/dialogboxes/1
  # PATCH/PUT /admin/dialogboxes/1.json
  def update
    respond_to do |format|
      if @admin_dialogbox.update(admin_dialogbox_params)
        format.html { redirect_to @admin_dialogbox, notice: 'Dialogbox was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_dialogbox }
      else
        format.html { render :edit }
        format.json { render json: @admin_dialogbox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/dialogboxes/1
  # DELETE /admin/dialogboxes/1.json
  def destroy
    @admin_dialogbox.destroy
    respond_to do |format|
      format.html { redirect_to admin_dialogboxes_url, notice: 'Dialogbox was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_dialogbox
      @admin_dialogbox = Admin::Dialogbox.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_dialogbox_params
      params.fetch(:admin_dialogbox, {})
    end
end
