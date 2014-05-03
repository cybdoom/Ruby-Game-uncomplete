class Cursor < Core::GameObject
  component :visual
  component :spatial

  def initialize
    super
    self.draw_options = {
      image: 'cursor',
      z_order: Core::Graphics::MAX_Z_ORDER
    }
    self.size = {
      x: 20,
      y: 20
    }
    self.offset = {
      x: 0,
      y: 0
    }
    Core::Graphics.cursor = self
  end

  def update
    offset = {
      x: Core::Graphics.main_screen.mouse_x - Core::Graphics.settings.resolution[:x] / 2,
      y: Core::Graphics.main_screen.mouse_y - Core::Graphics.settings.resolution[:y] / 2
    }
  end
end
