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
              x: 1024,
              y: 768
            },
            fullscreen: false
          })
        end
      end
    end

  end
end
