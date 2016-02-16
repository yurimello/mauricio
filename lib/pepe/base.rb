class Pepe::Base

  def initialize(interaction, match)
    @interaction = interaction
    @match = match
  end

  def answer
    {"content" => @interaction.answer, "partial" => "message/messages"}
    
  end

  private 
    def load_interactions
      @interactions ||= Interaction.all
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