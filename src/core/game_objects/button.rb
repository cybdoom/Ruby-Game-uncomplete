class Button < Core::GameObject
  component :visual
  component :spatial
  component :clickable

  def initialize
    super
    self.draw_options = {
      image: 'button'
    }
    self.size = {
      x: 100,
      y: 50
    }
    self.offset = {
      x: 0,
      y: 0
    }
  end

  def mouse_button_down id
    Core::Game.quit if id == :left
  end
end
