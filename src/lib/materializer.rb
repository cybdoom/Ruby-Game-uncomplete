module Materializer
  DATA_DIR = File.expand_path File.join('..', 'data'), File.dirname(__FILE__)

  # instance mixings
  def deep_save relative_path=nil
    relative_path = self.class.default_path if relative_path.to_s.empty?
    relative_path += '.rbo' if File.extname(relative_path).empty?
    full_path = File.join DATA_DIR, relative_path
    dir = File.dirname(full_path)
    FileUtils.mkdir_p dir unless File.directory? dir
    File.open(full_path, 'w') { |file_stream| file_stream.puts Marshal.dump self }
  end

  # class mixings
  def self.included receiver
    receiver.extend ClassMethods
  end

  module ClassMethods
    def deep_load relative_path=nil
      relative_path = self.default_path if relative_path.to_s.empty?
      relative_path += '.rbo' if File.extname(relative_path).empty?
      full_path = File.join DATA_DIR, relative_path
      File.open(full_path, 'r') { |file_stream| Marshal.load file_stream }
    rescue
      nil
    end

    def default_path
      File.join self.name.split("::").map { |namespace| namespace.underscore }
    end
  end
end
