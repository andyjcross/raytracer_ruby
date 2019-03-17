require "chunky_png"

class Image
  def initialize(width, height)
    @buffer = ChunkyPNG::Image.new(width, height, ChunkyPNG::Color::TRANSPARENT)
  end

  def width; @buffer.width; end
  def height; @buffer.height; end

  def set_pixel(x, y, color)
    @buffer[x,y] = ChunkyPNG::Color.rgb(
      (color.r * 255).to_i.clamp(0,255),
      (color.g * 255).to_i.clamp(0,255),
      (color.b * 255).to_i.clamp(0,255),
    )
  end

  def save(filename)
    @buffer.save(filename)
  end
end