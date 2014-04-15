class Button < Core::GameObject
  include Core::Components::Visual
  include Core::Components::Spatial

  def initialize
    puts @draw_options
  end

  def mouse_button_down id
    Core::Game.quit if id == :left
  end
end
