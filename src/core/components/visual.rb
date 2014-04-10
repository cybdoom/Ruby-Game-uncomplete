module Core
  module Components
    module Visual
      def initialize
        @draw_options = {
          texture_name: 'no_texture.png',
          z_order: 0
        }
      end

      def radius
        @radius
      end

      def coordinates
        @coordinates
      end

      def size
        @size
      end

      def draw_options
        @draw_options
      end

      def rectangle
        {
          left: @coordinates[:x] - size[:x] / 2,
          right: @coordinates[:x] + size[:x] / 2,
          top: @coordinates[:y] - size[:y] / 2,
          bottom: @coordinates[:x] + size[:y] / 2,
        }
      end

      def relative_coordinates object
        parent = self.parent
        child_coordinates = @coordinates

        while parent &&
              !parent.is_a?(Core::Scene) &&
              parent != object
          child_coordinates[:x] += parent.coordinates[:x]
          child_coordinates[:y] += parent.coordinates[:y]
          parent = parent.parent
        end

        child_coordinates
      end

      def contains_point? point
        if radius
          (coordinates[:x] - point[:x])**2 + (coordinates[:x] - point[:x])**2 <= self.radius**2
        else
          point[:x] >= rectangle[:left] &&
          point[:x] <= rectangle[:right] &&
          point[:y] <= rectangle[:bottom] &&
          point[:y] >= rectangle[:top]
        end
      end

      def draw
        options = draw_options

        texture = Core::Graphics::TextureManager[options[:texture_name]]

        options[:native_scale] = {
          x: size[:x].to_f / texture.width,
          y: size[:y].to_f / texture.height
        }

        texture.draw(
          Core::Graphics.settings.resolution[:x] / 2 + coordinates[:x] - size[:x] / 2,
          Core::Graphics.settings.resolution[:y] / 2 + coordinates[:y] - size[:y] / 2,
          options[:z_order],
          options[:native_scale][:x],
          options[:native_scale][:y]
        )
      end

      def self.included receiver
        receiver.extend ClassMethods
      end
    end
  end
end
