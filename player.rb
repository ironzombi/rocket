class Player 
    def initialize(window)
        @x = 200
        @y = 600
        @velocity_x = 0
        @velocity_y = 0
        @width = 240
        @height = 160
        @angle = 0
        @player_img = Gosu::Image.new('img/rocket.png')
    end

    def draw
        @player_img.draw_rot(@x, @y, 1, @angle)
    end

    def turn_right
        @angle += 3
    end

    def turn_left
        @angle -= 3
    end

    def accelerate
        @velocity_x += Gosu.offset_x(@angle, 2)
        @velocity_y += Gosu.offset_y(@angle, 2)
    end

    def move
        @x += @velocity_x
        @y += @velocity_y
        @velocity_x *= 0.9
        @velocity_y *= 0.9
    end

end