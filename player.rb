class Player 
  ROTATION_SPEED = 3
  ACCELERATION = 2
  FRICTION = 0.9
    def initialize(window)
        @x = 200
        @y = 600
        @velocity_x = 0
        @velocity_y = 0
        @width = 240
        @height = 160
        @angle = 0
        @radius = 20
        @window = window
        @player_img = Gosu::Image.new('img/rocket.png')
    end

    def draw
        @player_img.draw_rot(@x, @y, 1, @angle)
    end

    def turn_right
        @angle += ROTATION_SPEED
    end

    def turn_left
        @angle -= ROTATION_SPEED
    end

    def accelerate
        @velocity_x += Gosu.offset_x(@angle, ACCELERATION)
        @velocity_y += Gosu.offset_y(@angle, ACCELERATION)
    end

    def move
        @x += @velocity_x
        @y += @velocity_y
        @velocity_x *= FRICTION
        @velocity_y *= FRICTION
        if @x > @window.width - @radius
            @velocity = 0
            @x = @window.width - @radius
        end
        if @x < @radius
            @velocity_x = 0
            @x = @radius
        end
        if @y > @window.height - @radius
            @velocity_y = 0
            @y = @window.height - @radius
        end
    end

end