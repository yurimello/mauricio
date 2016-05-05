class Interaction < ApplicationRecord
  serialize :captures, Hash

  QUESTION_TYPES = {
    "basic_answer" => Mauricio::BasicAnswer,
    "chefsclub_restaurant_api" => Mauricio::Chefsclub::Restaurant,
    "chefsclub_subscription_information" => Mauricio::Chefsclub::Subscription,
    "chefsclub_configuration" => Mauricio::Chefsclub::Configuration,
    "youtube" => Mauricio::Youtube
  }
end
