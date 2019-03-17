class Sphere
  attr_reader :position, :radius, :color

  def initialize(position, radius, color)
    @position = position
    @radius = radius
    @color = color
  end

  def intersect(ray)
    # dst = ray.position - position
    # b = 2.0 * dst.dot_product(ray.direction)
    # c = dst.dot_product(dst) - (radius * radius)
    # discr = b * b - 4.0 * c

    # if discr >= 0
    #   t0 = (-b - Math.sqrt(discr)) * 0.5
    #   if t0 >= 0
    #     intersection_position = ray.position + (ray.direction * t0)
    #     normal = (intersection_position - position).normalized
    #     return { distance: t0, normal: normal }
    #   end
    # end
    # return nil

    dist = position - ray.position
    b = ray.direction.dot_product(dist)
    d = (b * b) - dist.dot_product(dist) + (radius * radius)

    return nil if d < 0.0

    t0 = b - Math.sqrt(d)

    intersection_position = ray.position + (ray.direction * t0)
    normal = (intersection_position - position).normalized

    return { object: self, distance: t0, normal: normal }
  end
end