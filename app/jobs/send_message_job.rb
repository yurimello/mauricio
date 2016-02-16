class SendMessageJob < ChatJob
  queue_as :default
 
  def perform(content)
    pepe = Pepe::Engine.new
    answer = pepe.answer(content)
    message = Message.create! content: answer["content"], from: 'pepe'
    broadcast(message, answer)
  end
end