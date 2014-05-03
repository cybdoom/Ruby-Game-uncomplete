module Core
  module Components
    module Spatial
      property :size
      property :offset
      property :radius

      def rectangle
        {
          left: offset_against()[:x] - size[:x] / 2,
          right: offset_against()[:x] + size[:x] / 2,
          top: offset_against()[:y] - size[:y] / 2,
          bottom: offset_against()[:x] + size[:y] / 2,
        }
      end

      def contains_point? point
        if radius
          (offset_against()[:x] - point[:x])**2 + (offset_against()[:x] - point[:x])**2 <= self.radius**2
        else
          point[:x] >= rectangle[:left] &&
          point[:x] <= rectangle[:right] &&
          point[:y] <= rectangle[:bottom] &&
          point[:y] >= rectangle[:top]
        end
      end

      def offset_against object=nil
        parent = self.parent
        child_offset = @offset

        while parent &&
              parent != object
          child_offset[:x] += parent.offset[:x]
          child_offset[:y] += parent.offset[:y]
          parent = parent.parent
        end

        child_offset
      end
    end
  end
end
