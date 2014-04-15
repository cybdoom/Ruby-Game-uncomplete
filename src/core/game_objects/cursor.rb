class Cursor < Core::GameObject
  include Core::Components::Visual
  include Core::Components::Spatial

  def initialize
    super
    @draw_options[:texture_name] = 'cursor.png'
    Core::Graphics.cursor = self
  end

  def update
    @coordinates = {
      x: Core::Graphics.main_screen.mouse_x - Core::Graphics.settings.resolution[:x] / 2,
      y: Core::Graphics.main_screen.mouse_y - Core::Graphics.settings.resolution[:y] / 2
    }
  end
end
