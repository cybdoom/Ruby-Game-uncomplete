class Button < Control
  include Core::Components::Clickable

  def initialize
    super
    @coordinates = {
      x: 0,
      y: 0
    }
    @size = {
      x: 150,
      y: 50
    }
  end

  def mouse_button_down id
    Core::Game.quit if id == :left
  end
end
