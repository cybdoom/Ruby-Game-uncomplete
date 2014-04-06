module Core
  class Scene
    include Materializer

    attr_accessor :objects, :focused_object

    def initialize
      @objects = [] << Cursor.new
      @focused_object = self
    end

    def key_down key
      case key
      when Gosu::KbEscape
        Core::Game.exit
      end
    end

    class << self
      def current
        @@current
      end

      def current= value
        @@current = value
      end
    end
  end
end
