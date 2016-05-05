class Mauricio::Chefsclub::Configuration < Mauricio::Chefsclub::Subscription
  
  def answer
    params = build_params
    if params.blank?
      {"content" => @interaction.answer, "partial" => "messages/message"}
    else
      s = $redis.get('subscription')
      subscription_information = JSON.parse s unless s.blank?
      subscription_information = get_subscription_information if subscription_information.blank?
      subscription = subscription_information["subscription"]
      message = "Olá #{subscription['first_name']} #{subscription['last_name']}! Seja bem-vindo."
      {"content" => message, "partial" => "messages/message"}
    end
  end
end