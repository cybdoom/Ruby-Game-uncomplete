module Core
  module Components
    module Visual
      def coordinates
        @coordinates
      end

      def size
        @size
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

      def draw
        options = draw_options || default_draw_options

        texture = Core::Graphics::TextureManager[options[:texture_name]]

        options[:native_scale] = {
          x: size[:x].to_f / texture.width,
          y: size[:y].to_f / texture.height
        }
        puts options[:native_scale]

        texture.draw(
          Core::Graphics.settings.resolution[:x] / 2 + coordinates[:x] - size[:x] / 2,
          Core::Graphics.settings.resolution[:y] / 2 + coordinates[:y] - size[:y] / 2,
          0,
          options[:native_scale][:x],
          options[:native_scale][:y],
        )
      end

      def draw_options
        @draw_options
      end

      def default_draw_options
        self.class.class_variable_get('@@default_draw_options')
      end

      def self.included receiver
        receiver.extend ClassMethods
      end

      module ClassMethods
        def default_draw_options= value
          self.class_variable_set('@@default_draw_options', value)
        end
      end
    end
  end
end
