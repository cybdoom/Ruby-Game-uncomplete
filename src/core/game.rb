module Core
  module Game
    def self.init scene=nil
      Core::Scene.current = scene || MainMenu.new
    end

    def self.quit
      Core::Scene.current.deep_save unless Core::Scene.current.is_a? MainMenu
      Core::Graphics.main_screen.close
      Core::Graphics.settings.deep_save
    end
  end
end
