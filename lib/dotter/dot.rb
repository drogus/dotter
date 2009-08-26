class Dotter::Dot
  attr_accessor :x, :y, :radius
  def initialize(x, y)
    @x, @y = x, y
  end

  def -(other)
    dot = self.dup
    dot.x -= other.x
    dot.y -= other.y
    dot
  end
end
