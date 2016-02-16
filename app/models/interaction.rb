class Interaction < ApplicationRecord
  serialize :captures, Hash

  QUESTION_TYPES = {
    "chefsclub_restaurant_api" => Pepe::Chefsclub::Restaurant,
    "basic_answer" => Pepe::BasicAnswer
  }
end
