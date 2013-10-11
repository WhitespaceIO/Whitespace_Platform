class Action
  def self.new(object, *args, &block)
    action_class = Class.new
    action = action_class.state_machine(*args, &block)
    attribute = action.attribute
    action = action.action

    action_class.class_eval do
      define_method(:definition) { action }
      define_method(attribute) { object.send(attribute) }
      define_method("#{attribute}=") {|value| object.send("#{attribute}=", value) }
      define_method(action) { object.send(action) } if action
    end

    action_class.new
  end
end