class Pepe::Interaction < Pepe::Base
  def initialize
    @interactions = load_interactions
  end

  def answer(question)
    @interactions.each do |interaction|
      question_regex = to_regex(interaction.question)
      if question_regex.match(question)
        return interaction.answer
      end
    end
    return 'não entendi isso...'
  end
end