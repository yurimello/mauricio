class Pepe::Base

  def initialize(interaction, match, question)
    @interaction = interaction
    @match = match
    @modifier = Pepe::InteractionModifier.new
    @question = question
  end

  def answer
    {"content" => @interaction.answer, "partial" => "messages/message"}
  end

  private 
    def load_interactions
      @interactions ||= Interaction.all
    end

    def load_modifiers
      @modifiers ||= Modifier.all
    end

    def to_regex(str)
      Regexp.new(str, Regexp::IGNORECASE)
    end

    def process_captures
      params = {}
      @interaction.captures.each do |k, v|
        index = k.to_i
        params[v] = @match[index].strip
      end
      return params
    end

    def to_query(hash)
      CGI.unescape(hash.to_query)
    end
end