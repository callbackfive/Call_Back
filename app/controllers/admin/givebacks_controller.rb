class Admin::GivebacksController < ApplicationController
  layout 'admin'
  before_action :set_admin_giveback, only: [:show, :edit, :update, :destroy]

  # GET /admin/givebacks
  # GET /admin/givebacks.json
  def index
    @admin_givebacks = Admin::Giveback.all.includes(:project)
  end

  # GET /admin/givebacks/1
  # GET /admin/givebacks/1.json
  def show
  end

  # GET /admin/givebacks/new
  def new
    @admin_giveback = Admin::Giveback.new
  end

  # GET /admin/givebacks/1/edit
  def edit
  end

  # POST /admin/givebacks
  # POST /admin/givebacks.json
  def create
    @admin_giveback = Admin::Giveback.new(admin_giveback_params)

    respond_to do |format|
      if @admin_giveback.save
        format.html { redirect_to admin_givebacks_path, notice: 'Giveback was successfully created.' }
        format.json { render :show, status: :created, location: @admin_giveback }
      else
        format.html { render :new }
        format.json { render json: @admin_giveback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/givebacks/1
  # PATCH/PUT /admin/givebacks/1.json
  def update
    respond_to do |format|
      if @admin_giveback.update(admin_giveback_params)
        format.html { redirect_to admin_givebacks_path, notice: 'Giveback was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_giveback }
      else
        format.html { render :edit }
        format.json { render json: @admin_giveback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/givebacks/1
  # DELETE /admin/givebacks/1.json
  def destroy
    @admin_giveback.destroy
    respond_to do |format|
      format.html { redirect_to admin_givebacks_url, notice: 'Giveback was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_giveback
      @admin_giveback = Admin::Giveback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_giveback_params
      params.fetch(:admin_giveback).permit(:title, :price, :description, :deliver_time, :project_id, :image)
    end
end
