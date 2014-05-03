module Core
  module Graphics
    module ImageManager
      DIR = File.expand_path File.join(Core::ROOT, '..', '..', 'media', 'images')
      @@images = {}

      def self.[] name
        if @@images[name].nil?
          name += '.png' if File.extname(name).empty?
          full_path = File.join DIR, name
          @@images[name] = ::Gosu::Image.new Core::Graphics.main_screen, full_path, true
        else
          @@images[name]
        end
      end
    end
  end
end
