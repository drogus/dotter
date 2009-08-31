require "RMagick"

module Dotter
end
class Dotter::Dotter
  attr_accessor :dots

  def initialize(opts = {})
    @dots = opts.delete(:dots) || []
    @width = opts.delete(:width) || 256
    @height = opts.delete(:height) || 256
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
    return if dots.nil? || dots.length == 0
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

directory = File.expand_path(File.dirname(__FILE__))
require File.join(directory, 'dotter', 'dot')
require File.join(directory, 'dotter', 'lat_lng')
require File.join(directory, 'dotter', 'gmap')
require File.join(directory, 'dotter', 'tile')
require File.join(directory, 'dotter', 'point')

