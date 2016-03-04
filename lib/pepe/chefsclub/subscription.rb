class Pepe::Chefsclub::Subscription < Pepe::Chefsclub
  
  def ansewer
    params = build_params
    if params.blank?
      {"content" => @interaction.answer, "partial" => "messages/message"}
    else
      subscription_information = get_subscription_information
      subscription = subscription_information["subscription"]
      message = "#{subscription['first_name']} #{subscription['last_name']}, sua assinatura está #{subscription_information['status']}"
      {"content" => message, "partial" => "messages/message"}
    end
  end

  private
    def partial
      "messages/message"
    end

    def build_request
      "#{domain}#{endpoint}/#{build_params}"
    end

    def build_params
      processed_params = process_captures
      if processed_params['identification'].blank?
        $redis.get('identification')
      else
        $redis.set('identification', processed_params['identification'])
        processed_params['identification']
      end
    end

    def endpoint
      "/api/v2/mobile/subscriptionInformations"
    end

    def get_subscription_information
      request_params = build_request
      puts "!!!!!!!  #{request_params} !!!!!!"
      uri = URI(request_params)
      response = Net::HTTP.get(uri)
      $redis.set('subscription', response)
      JSON.parse response
    end
end