class TextingsController < ApplicationController
  def index
  end

  def show
    @texting_id = params[:id]
  end
end
