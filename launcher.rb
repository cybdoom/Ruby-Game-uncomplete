class Launcher
  class << self
    def run
      extend_basic
      load_libs
      load_core
      Core::Graphics.initialize
      Core::Game.initialize
    end

    private

    def extend_basic
      class ::String
        def underscore string
          string.
            gsub(/::/, '/').
            gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
            gsub(/([a-z\d])([A-Z])/,'\1_\2').
            tr("-", "_").
            downcase
        end
      end
    end

    def load_libs
      require 'nokogiri'
    end

    def load_core
      module Core
        ROOT = File.join(Dir.pwd, 'core')
        Dir[File.join(ROOT, '**', '*.rb')].each { |file_name| require file_name }
      end
    end
  end
end

Launcher.run
