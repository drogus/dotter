directory = File.expand_path(File.dirname(__FILE__))

require "RMagick"
require File.join(directory, 'dotter', 'dot')

class Dotter
  attr_accessor :dots

  def initialize(opts)
    @dots = opts.delete(:dots)
    @width = opts.delete(:width) || 100
    @height = opts.delete(:height) || 100
    @radius = opts.delete(:radius) || 5
  end

  def generate_image
    image = Magick::Image.new(@width, @height) do
      self.background_color = "transparent"
    end

    draw_dots(image)

    image
  end

  def draw_dots(image)
    gc = Magick::Draw.new

    dots.each do |dot|
      draw_dot(gc, dot)
    end

    gc.draw(image)
  end

  def draw_dot(gc, dot)
    gc.fill("white")
    gc.circle(dot.x, dot.y, dot.x - @radius, dot.y)
    gc.fill("black")
    gc.circle(dot.x, dot.y, dot.x - @radius + 1, dot.y)
  end
end
