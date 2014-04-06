class Cursor < Core::GameObject
  include Core::Components::Visual

  @@texture_name = 'cursor.png'

  def update
    @coordinates = {
      x: Core::Graphics.main_screen.mouse_x,
      y: Core::Graphics.main_screen.mouse_y
    }
  end
end
