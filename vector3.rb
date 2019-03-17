class Vector3
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def *(other)
    if other.is_a?(Numeric)
      self.class.new(x * other, y * other, z * other)
    elsif other.is_a?(self.class)
      self.class.new(x * other.x, y * other.y, z * other.z)
    end
  end

  def +(other)
    self.class.new(x + other.x, y + other.y, z + other.z)
  end

  def -(other)
    self.class.new(x - other.x, y - other.y, z - other.z)
  end

  def dot_product(other)
    (x * other.x) + (y * other.y) + (z * other.z)
  end

  def normalized
    length = Math.sqrt(x*x + y*y + z*z)
    self.class.new(x / length, y / length, z / length)
  end
end