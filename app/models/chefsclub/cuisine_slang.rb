class Chefsclub::CuisineSlang < ApplicationRecord
  def self.generate_interaction_to_all
    cuisines = all.map{|c| [c.slang, c.translated]}.flatten
    cuisines_to_find = cuisines[0..4].join("|")
    cuisines = cuisines.join("|")
    Interaction.where("question LIKE '%#{cuisines_to_find}%'").delete_all
    Interaction.create question: ".*(#{cuisines})", answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"1" => 'cuisines'}
    Interaction.create question: ".*(#{cuisines})(\s(no|na|em)\s)(.+)", answer: 'hmmm voce quer um restaurante', question_type: 'chefsclub_restaurant_api', captures: {"1" => 'cuisines', "4" => 'neighborhood'}
  end

end
