class SendMessageJob < ChatJob
  queue_as :default
 
  def perform(content)
    mauricio = Mauricio::Engine.new
    answer = mauricio.answer(content)
    message = Message.create! content: answer["content"], from: 'mauricio'
    broadcast(message, answer)
  end
end