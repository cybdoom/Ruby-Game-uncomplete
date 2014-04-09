class Button < Control

  attr_accessor :click

  def initialize
    super
    @coordinates = {
      x: 0,
      y: 0
    }
    @size = {
      x: 100,
      y: 25
    }
  end
end

Button.default_draw_options = {
  texture_name: 'button.png',
  z_order: 0
}
