class Interaction < ApplicationRecord
  serialize :captures, Hash

  QUESTION_TYPES = {
    "basic_answer" => Pepe::BasicAnswer,
    "chefsclub_restaurant_api" => Pepe::Chefsclub::Restaurant,
    "chefsclub_subscription_information" => Pepe::Chefsclub::Subscription,
    "chefsclub_configuration" => Pepe::Chefsclub::Configuration,
    "youtube" => Pepe::Youtube
  }
end
