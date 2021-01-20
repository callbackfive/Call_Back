class Admin::CommentsController < ApplicationController
  layout 'admin'
  before_action :set_admin_comment, only: [:show, :edit, :update, :destroy]

  # GET /admin/comments
  # GET /admin/comments.json
  def index
    @admin_comments = Admin::Comment.all
  end

  # GET /admin/comments/1
  # GET /admin/comments/1.json
  def show
  end

  # GET /admin/comments/new
  def new
    @admin_comment = Admin::Comment.new
  end

  # GET /admin/comments/1/edit
  def edit
  end

  # POST /admin/comments
  # POST /admin/comments.json
  def create
    @admin_comment = Admin::Comment.new(admin_comment_params)

    respond_to do |format|
      if @admin_comment.save
        format.html { redirect_to admin_comments_path, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @admin_comment }
      else
        format.html { render :new }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/comments/1
  # PATCH/PUT /admin/comments/1.json
  def update
    respond_to do |format|
      if @admin_comment.update(admin_comment_params)
        format.html { redirect_to admin_comments_path, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_comment }
      else
        format.html { render :edit }
        format.json { render json: @admin_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/comments/1
  # DELETE /admin/comments/1.json
  def destroy
    @admin_comment.destroy
    respond_to do |format|
      format.html { redirect_to admin_comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_comment
      @admin_comment = Admin::Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_comment_params
      params.fetch(:admin_comment).permit(:user_id, :project_id, :parent_id, :content)
    end
end
