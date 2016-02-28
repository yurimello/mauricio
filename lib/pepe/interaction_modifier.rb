class Pepe::InteractionModifier  < Pepe::Base
  def initialize
    load_modifiers
  end

  def capture_modifiers(expression)
    captures = {}
    byebug
    @modifiers.each do |modifier|
      modifier_regex = to_regex(modifier.expression)
      modifier_match = modifier_regex.match(expression)
      if modifier_match
        modifier_class = "Pepe::Pepe#{modifier.modifier_type.camelize}".constantize
        interaction_controller = modifier_class.new
        captures.merge!(interaction_controller.send(modifier.method))
      end
    end
    captures
  end
end