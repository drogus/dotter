class Dotter::Dot
  attr_accessor :x, :y, :radius, :color
  
  def initialize(x, y, opts = {})
    @x, @y = x, y

    @color = opts.delete(:color)
  end

  def -(other)
    dot = self.dup
    dot.x -= other.x
    dot.y -= other.y
    dot
  end
end
