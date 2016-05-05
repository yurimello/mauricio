class Mauricio::Engine < Mauricio::Base
  def initialize
    load_interactions
    load_children_interactions
  end

  def answer(question)
    capture_interaction(question, @children_interactions) || 
    capture_interaction(question, @interactions) || 
    {"content" => 'não entendi isso...', "partial" => 'messages/message'} 
  end

  def capture_interaction(question, interactions)
    interactions.each do |interaction|
      question_regex = to_regex(interaction.question)
      question_match = question_regex.match(question)
      if question_match
        question_class = Interaction::QUESTION_TYPES[interaction.question_type]
        interaction_controller = question_class.new(interaction, question_match, question)
        $redis.set("interaction_id", interaction.id)
        return interaction_controller.answer
      end
    end
    nil
  end
end