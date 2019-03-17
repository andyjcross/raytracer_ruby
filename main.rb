require_relative "vector3"
require_relative "ray"
require_relative "color"
require_relative "sphere"
require_relative "light"
require_relative "image"

objects = [
  Sphere.new(Vector3.new(-3, -1, 3), 4, Color.new(0, 0, 1)), # blue
  Sphere.new(Vector3.new(3, -2, 0), 1, Color.new(1, 0, 0)), # red
  Sphere.new(Vector3.new(0, 3, 8), 3, Color.new(0, 1, 0)) # green
]

lights = [
  Light.new(Vector3.new(8, -1, 1), 1.0)
]

eye_position = Vector3.new(0, 0, -10)
window_width = 10
window_height = 10

image = Image.new(512, 512)

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
      surface_color = closest_intersection[:object].color

      ambient_color = Color.new(1.0, 1.0, 1.0)
      ambient_factor = 0.2

      color = color + (surface_color * ambient_color * ambient_factor)

      lights.each do |light|
        light_direction = (light.position - closest_intersection[:position]).normalized
        light_color = Vector3.new(1.0, 1.0, 1.0)
        diffuse_factor = 1.0

        objects.each do |object|
          shadow_ray = Ray.new(closest_intersection[:position] + (light_direction * 0.001), light.position)

          shadow_intersection = object.intersect(shadow_ray)
          if shadow_intersection && shadow_intersection[:distance] > 0.0
            diffuse_factor = 0.0
            break
          end
        end

        cos_incident_angle = light_direction.dot_product(closest_intersection[:normal])
        if cos_incident_angle > 0

          color += (light_color * cos_incident_angle * surface_color * diffuse_factor)
        end
      end
    end

    image.set_pixel(x, y, color)
  end
end

image.save("output.png")

