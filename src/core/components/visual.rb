module Core
  module Components
    module Visual
      property :draw_options

      def draw
        options = self.draw_options
        image = Core::Graphics::ImageManager[options[:image]]

        options[:sprite_size] =
        if self.has_component? Core::Components::Spatial
          {
            x: size[:x],
            y: size[:y]
          }
        else
          {
            x: image.width,
            y: image.height
          }
        end

        puts self
        options[:sprite_coordinates] = {
          x: Core::Graphics.settings.resolution[:x] / 2,
          y: Core::Graphics.settings.resolution[:y] / 2
        }
        puts options[:sprite_coordinates]
        options[:sprite_coordinates] = {
          x: options[:sprite_coordinates][:x] + offset_against()[:x],
          y: options[:sprite_coordinates][:y] + offset_against()[:y]
        } if self.class.include? Core::Components::Spatial
        puts options[:sprite_coordinates]

        image.draw(
          options[:sprite_coordinates][:x] - options[:sprite_size][:x] / 2,
          options[:sprite_coordinates][:y] - options[:sprite_size][:y] / 2,
          options[:z_order] || Core::Graphics::DEFAULT_Z_ORDER
        )
      end
    end
  end
end
