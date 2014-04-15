module Core
  class GameObject
    include Initializer

    attr_accessor :parent, :children

    def has_component? component
      self.class.included? component
    end

    def is_focused?
      Core::Scene.current.focused_object == self
    end
  end
end
