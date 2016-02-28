class Pepe::Engine < Pepe::Base
  def initialize
    @interactions = load_interactions
  end

  def answer(question)
    @interactions.each do |interaction|
      question_regex = to_regex(interaction.question)
      question_match = question_regex.match(question)
      if question_match
        question_class = Interaction::QUESTION_TYPES[interaction.question_type]
        interaction_controller = question_class.new(interaction, question_match, question)
        return interaction_controller.answer
      end
    end
    return 'não entendi isso...'
  end
end