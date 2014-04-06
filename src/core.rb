module Core
  ROOT = File.join File.dirname(__FILE__), 'core'

  def self.load
    Dir[File.join ROOT, '*.rb'].each { |file_name| require file_name }

    rec_load 'graphics'
    rec_load 'components'
    rec_load 'game_objects'
    rec_load 'scenes'
  end

  private

  def self.rec_load relative_path
    Dir[File.join ROOT, relative_path, '**', '*.rb'].each { |file_name| require file_name }
  end
end
