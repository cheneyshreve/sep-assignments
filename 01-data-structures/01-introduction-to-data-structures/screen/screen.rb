require_relative 'pixel'


class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width, @height = width, height
    # create a 2D array to hold the data
    @matrix = Array.new(@width) {Array.new(@height)}
  end

  # Insert a Pixel at x, y for valid coordinates
  def insert(pixel, x, y)
    if inbounds(x,y)
      @matrix[x][y] = pixel
    end
  end

  # extract pixel values for valid x,y coordinates
  def at(x, y)
    if inbounds(x,y)
      @matrix[x][y]
    end
  end

  private

  # determine if x,y are valid coordinates
  def inbounds(x, y)
    if x <= @width && y <= @height
      return true
    else
      return nil
    end
  end

end
