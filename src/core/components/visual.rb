module Core
  module Components
    module Visual
      def coordinates
        @coordinates || { x: 0, y: 0 }
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
        Core::Graphics::TextureManager[self.class.texture_name].draw(
          coordinates[:x],
          coordinates[:y],
          0
        )
      end

      def self.included receiver
        receiver.extend ClassMethods
      end

      module ClassMethods
        def texture_name
          self.class_variable_get('@@texture_name')
        end
      end
    end
  end
end
