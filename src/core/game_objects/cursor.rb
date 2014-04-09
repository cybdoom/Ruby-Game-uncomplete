class Cursor < Core::GameObject
  include Core::Components::Visual

  def initialize
    super
    @coordinates = {
      x: 0,
      y: 0
    }
    @size = {
      x: 20,
      y: 20
    }
  end

  def update
    @coordinates = {
      x: Core::Graphics.main_screen.mouse_x - Core::Graphics.settings.resolution[:x] / 2,
      y: Core::Graphics.main_screen.mouse_y - Core::Graphics.settings.resolution[:y] / 2
    }
  end
end

Cursor.default_draw_options = {
  texture_name: 'cursor.png',
  z_order: 999
}
