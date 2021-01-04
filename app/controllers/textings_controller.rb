class TextingsController < ApplicationController
  def index
    @textings = Texting.all
  end

  def show
    @texting_id = params[:id]
  end

  def create
  end
end
