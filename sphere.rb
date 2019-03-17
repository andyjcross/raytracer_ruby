class Sphere
  attr_reader :position, :radius, :color

  def initialize(position, radius, color)
    @position = position
    @radius = radius
    @color = color
  end

  def intersect(ray)
    dist = position - ray.position
    b = ray.direction.dot_product(dist)
    d = (b * b) - dist.dot_product(dist) + (radius * radius)

    return nil if d < 0.0

    t = b - Math.sqrt(d)

    intersection_position = ray.position + (ray.direction * t)
    normal = (intersection_position - position).normalized
    return { object: self, distance: t, position: intersection_position, normal: normal }
  end
end