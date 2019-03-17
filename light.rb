class Light
  attr_reader :position, :radius

  def initialize(position, radius)
    @position = position
    @radius = radius
  end
end