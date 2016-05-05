class Mauricio::InteractionModifier  < Mauricio::Base
  def initialize
    load_modifiers
  end

  def capture_modifiers(expression)
    captures = {}
    @modifiers.each do |modifier|
      modifier_regex = to_regex(modifier.expression)
      modifier_match = modifier_regex.match(expression)
      if modifier_match
        modifier_class = "Mauricio::Mauricio#{modifier.modifier_type.camelize}".constantize
        interaction_controller = modifier_class.new
        captures.merge!(interaction_controller.send(modifier.method))
      end
    end
    captures
  end
end