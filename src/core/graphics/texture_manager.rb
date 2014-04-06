module Core
  module Graphics
    module TextureManager
      DIR = File.expand_path File.join(Core::ROOT, '..', '..', 'media', 'textures')
      @@textures = {}

      def self.[] texture_name
        if @@textures[texture_name].nil?
          full_path = File.join DIR, texture_name
          @@textures[texture_name] = ::Gosu::Image.new Core::Graphics.main_screen, full_path, true
        else
          @@textures[texture_name]
        end
      end
    end
  end
end
