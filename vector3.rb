class Vector3
  attr_reader :x, :y, :z

  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def *(scalar)
    self.class.new(x * scalar, y * scalar, z * scalar)
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