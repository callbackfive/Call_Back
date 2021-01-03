class TextingChannel < ApplicationCable::Channel
  def subscribed
    stream_from "texting_channel_#{params[:texting_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
