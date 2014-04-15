module Core
  module Components
    module Spatial
      def initialize
        @size = {
          x: 50,
          y: 50
        }

        @coordinates = {
          x: 0,
          y: 0
        }

        super
      end

      def coordinates
        @coordinates
      end

      def size
        @size
      end

      def radius
        @radius
      end

      def rectangle
        {
          left: @coordinates[:x] - size[:x] / 2,
          right: @coordinates[:x] + size[:x] / 2,
          top: @coordinates[:y] - size[:y] / 2,
          bottom: @coordinates[:x] + size[:y] / 2,
        }
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
    end
  end
end
