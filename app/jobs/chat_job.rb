class ChatJob < ApplicationJob
  private
    def render_message(message)
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end

    def broadcast(message)
      ActionCable.server.broadcast 'room_channel', message: render_message(message)
    end
end