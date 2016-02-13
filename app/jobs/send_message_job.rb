class SendMessageJob < ChatJob
  queue_as :default
 
  def perform(content)
    message = Message.create! content: 'oi', from: 'pepe'
    broadcast(message)
  end
end