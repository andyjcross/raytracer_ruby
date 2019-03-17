class Ray
  attr_accessor :position, :direction

  def initialize(origin_position, target_position)
    @position = origin_position
    @direction = (target_position - origin_position).normalized
  end
end