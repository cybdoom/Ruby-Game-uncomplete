module Core
  module Graphics
    class MainScreen < ::Gosu::Window
      def initialize
        settings = Core::Graphics.settings
        super settings.resolution[:x],
              settings.resolution[:y],
              settings.fullscreen
      end

      def button_down id
        current_scene.button_down id
      end

      def update
        Core::Scene.current.objects.each { |object| object.update if object.respond_to? :update }
      end

      def draw
        Core::Scene.current.objects.each { |object| object.draw if object.respond_to? :draw }
      end

      private

      def current_scene
        Core::Scene.current
      end
    end
  end
end
