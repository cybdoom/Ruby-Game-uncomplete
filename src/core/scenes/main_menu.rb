class MainMenu < Core::Scene
  def initialize
    super
    @objects << Button.new.init_with_hash({
      coordinates: {
        x: 0,
        y: 0
      },
      size: {
        x: Core::Graphics.settings.resolution[:x] / 2,
        y: Core::Graphics.settings.resolution[:x] / 2
      },
      click: Proc.new {
        puts "#{ self } was clicked =)"
      }
    })
  end
end
