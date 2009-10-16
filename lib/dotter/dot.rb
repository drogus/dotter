class Dotter::Dot
  attr_accessor :x, :y, :radius, :dot_color
  
  def initialize(x, y, opts = {})
    @x, @y = x, y

    @dot_color = opts.delete(:dot_color)
  end

  def -(other)
    dot = self.dup
    dot.x -= other.x
    dot.y -= other.y
    dot
  end
end
