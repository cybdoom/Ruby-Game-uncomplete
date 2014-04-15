module Core
  module Components
    module Visual
      def initialize
        @draw_options = {
          texture_name: 'no_texture.png',
          z_order: 0
        }

        super
      end

      def draw
        options = @draw_options

        options[:sprite_coordinates] = @coordinates || { x: 0, y: 0 }

        texture = Core::Graphics::TextureManager[options[:texture_name]]

        texture.draw(
          options[:sprite_coordinates][:x] + Core::Graphics.settings.resolution[:x] / 2,
          options[:sprite_coordinates][:y] + Core::Graphics.settings.resolution[:y] / 2,
          options[:z_order]
        )
      end
    end
  end
end
