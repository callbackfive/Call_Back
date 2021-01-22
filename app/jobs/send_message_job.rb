class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # byebug

    html = ApplicationController.render(
      partial: 'messages/message',
      locals: { message: message }
      )
      ActionCable.server.broadcast "dialogbox_channel_#{message.dialogbox.id}", {html: html}

    # byebug

  end

  
end
