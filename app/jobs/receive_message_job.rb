class ReceiveMessageJob < ChatJob
  queue_as :default
 
  def perform(content)
    message = Message.create! content: content, from: 'me'
    answer = {"content" => content, "partial" => 'messages/message'}
    broadcast(message, answer)
    SendMessageJob.perform_later content
  end
end