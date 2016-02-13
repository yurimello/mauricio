class ReceiveMessageJob < ChatJob
  queue_as :default
 
  def perform(content)
    message = Message.create! content: content, from: 'me'
    broadcast(message)
    SendMessageJob.perform_later content
  end
end