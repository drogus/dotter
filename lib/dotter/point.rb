class Dotter::Point
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def ==(other)
    x == other.x && y == other.y
  end

  def -(other)
    point = self.dup
    point.x -= other.x
    point.y -= other.y
    point
  end

  def +(other)
    point = self.dup
    point.x += other.x
    point.y += other.y
    point
  end
end
