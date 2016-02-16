class Interaction < ApplicationRecord
  serialize :captures, Hash

  QUESTION_TYPES = {
    "basic_answer" => Pepe::BasicAnswer,
    "chefsclub_restaurant_api" => Pepe::Chefsclub::Restaurant,
    "youtube" => Pepe::Youtube
  }
end
