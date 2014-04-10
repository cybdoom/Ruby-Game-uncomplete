module Core
  class Scene
    include Materializer

    attr_accessor :objects, :focused_object

    def initialize
      @objects = [] << Cursor.new

      @focused_object = self
    end

    def button_down id
      if [::Gosu::MsLeft, ::Gosu::MsRight].include?(id) && !pointed_object.nil? && pointed_object.class.include?(Core::Components::Clickable)
        id == ::Gosu::MsLeft ? pointed_object.left_click : pointed_object.right_click
      end
      Core::Game.quit if id == ::Gosu::KbEscape
    end

    class << self
      def current
        @@current
      end

      def current= value
        @@current = value
      end
    end

    private

    def pointed_object
      queue = @objects.map { |object| { object: object, order: 1 } }
      pointed = { object: nil, order: 0 }

      while queue.any?
        if queue[0][:object].contains_point?(Core::Graphics.cursor.coordinates) &&
           !queue[0][:object].is_a?(Cursor) &&
           queue[0][:order] > pointed[:order]
          pointed = queue[0]
        end
        head = queue.shift
        head[:object].children.each do |child|
          queue << { object: child, order: head[:order] + 1 }
        end unless head[:object].children.nil?
      end

      pointed[:object]
    end
  end
end
