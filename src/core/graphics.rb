module Core
  module Graphics
    MAX_Z_ORDER = 999
    DEFAULT_Z_ORDER = 1

    def self.init settings=nil
      @@settings = settings || Core::Graphics::Settings.default
      @@main_screen = MainScreen.new
    end

    def self.main_screen
      @@main_screen
    end

    def self.settings
      @@settings
    end

    def self.run
      @@main_screen.show
    end

    def self.cursor
      @@cursor
    end

    def self.cursor= value
      @@cursor = value
    end

    def self.screen_center
      {
        x: settings.resolution[:x] / 2,
        y: settings.resolution[:y] / 2
      }
    end
  end
end
