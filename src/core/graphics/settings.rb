module Core
  module Graphics

    class Settings
      include Materializer
      include Initializer

      attr_accessor :resolution, :fullscreen

      class << self
        def default
          Settings.new.init_with_hash({
            resolution: {
              x: 1280,
              y: 1024
            },
            fullscreen: true
          })
        end
      end
    end

  end
end
