require "chunky_png"

class Image
  def initialize(width, height)
    @buffer = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::TRANSPARENT)
  end

  def width; @buffer.width; end
  def height; @buffer.height; end

  def set_pixel(x, y, color)
    @buffer[x,y] = ChunkyPNG::Color.rgb(color.r, color.g, color.b)
  end

  def save(filename)
    @buffer.save(filename)
  end
end