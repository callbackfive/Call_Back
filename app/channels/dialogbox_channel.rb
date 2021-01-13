class DialogboxChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dialogbox_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
