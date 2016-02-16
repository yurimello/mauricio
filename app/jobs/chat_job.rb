class ChatJob < ApplicationJob
  private
    def render_message(message, answer)
      ApplicationController.renderer.render(partial: answer["partial"], locals: { message: message, answer: answer })
    end

    def broadcast(message, answer)
      ActionCable.server.broadcast 'room_channel', message: render_message(message, answer)
    end
end