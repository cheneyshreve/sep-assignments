# Pixels require three color color: red, green, and blue.
# Pixel colors red, green, and blue color must be greater than zero and less than 255.
# If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
# Pixels also require a coordinate location: x and y.
# Pixels require three colors: red, green, and blue.
# Pixel colors red, green, and blue color must be greater than zero and less than 255.
# If  a value less than zero is specified, default to zero. If a value greater than 255 is specified, default to 255.
# Pixels also require a coordinate location: x and y.


class Pixel
  attr_accessor :red
  attr_accessor :green
  attr_accessor :blue
  attr_accessor :x
  attr_accessor :y

  def initialize(red, green, blue, x, y)
    @red,@green,@blue = validate_color(red), validate_color(green), validate_color(blue)
    @x, @y = x,y
  end

  def x
    @x
  end

  def y
   @y
  end


  private

  def validate_color(color)
    if color < 0
      color = 0
    elsif color > 255
      color = 255
    else
      color = color
    end
  end

end
