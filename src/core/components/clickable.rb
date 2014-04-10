module Core
  module Components
    module Clickable
      def initialize
        @left_click_handler = Proc.new { }
        @right_click_handler = Proc.new { }
      end

      def left_click_handler
        @left_click_handler
      end

      def left_click
        @left_click_handler.call
      end

      def right_click_handler
        @right_click_handler
      end

      def right_click
        @right_click_handler.call
      end
    end
  end
end
