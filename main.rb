require_relative "vector3"
require_relative "ray"
require_relative "color"
require_relative "sphere"
require_relative "light"
require_relative "image"

objects = [
  Sphere.new(Vector3.new(-3, -1, 3), 4, Color.new(0, 0, 255)), # blue
  Sphere.new(Vector3.new(5, -1, 5), 1, Color.new(255, 0, 0)), # red
  Sphere.new(Vector3.new(0, 3, 8), 3, Color.new(0, 255, 0)) # green
]

lights = [
  Light.new(Vector3.new(1, 8, 2), 5)
]

eye_position = Vector3.new(0, 0, -10)

window_width = 10
window_height = 10

image = Image.new(256, 256)

image.width.times do |x|
  image.height.times do |y|

    pixel_x = ((x.to_f / image.width) * window_width) - (window_width.to_f / 2)
    pixel_y = -(((y.to_f / image.height) * window_height) - (window_height.to_f / 2))
    pixel_position = Vector3.new(pixel_x, pixel_y, 0)

    ray = Ray.new(eye_position, pixel_position)

    color = Color.new(0, 0, 0)

    distance = Float::MAX
    closest_intersection = nil

    objects.each do |object|
      intersection = object.intersect(ray)
      if intersection && intersection[:distance] < distance
        distance = intersection[:distance]
        closest_intersection = intersection
      end
    end

    if closest_intersection
      color = closest_intersection[:object].color

      lights.each do |light|

      end
    end

    image.set_pixel(x, y, color)
  end
end

image.save("output.png")

