require 'gosu'
require_relative 'player'
# Game of Rockets

class Rocket < Gosu::Window
  def initialize 
    super(1024, 768)
    self.caption = 'Rocket Ship'
    @player = Player.new(self)
  end
  
  def draw
    @player.draw
  end
  
  def update
    @player.turn_left if button_down?(Gosu::KbLeft)
    @player.turn_right if button_down?(Gosu::KbRight)
    @player.accelerate if button_down?(Gosu::KbUp)
    @player.move
  end
end

window = Rocket.new
window.show
