class Pepe::Base
  private 
    def load_interactions
      @interactions ||= Interaction.all
    end

    def to_regex(str)
      Regexp.new(str, Regexp::IGNORECASE)
    end
end