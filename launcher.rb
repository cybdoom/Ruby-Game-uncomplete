class Launcher
  class << self
    def run
      load_libs
      load_core
      Core::Graphics.init Core::Graphics::Settings.deep_load
      Core::Game.init
      Core::Graphics.run
    end

    private

    def load_libs
      require 'nokogiri'
      require 'gosu'
      require 'pathname'
      require 'fileutils'

      libs_location = File.join File.dirname(__FILE__), 'src', 'lib'
      Dir[File.join(libs_location, '**', '*.rb')].each { |file_name| require file_name }
    end

    def load_core
      require File.join File.dirname(__FILE__), 'src', 'core'
      Core.load
    end
  end
end

Launcher.run
