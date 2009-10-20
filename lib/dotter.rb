require "RMagick"

module Dotter
end

# Dotter::Dotter allows to generate transparent image with dots representing points on map. This image can be used as a google maps tile. 
#
# Usage:
#
#     dotter = Dotter::Dotter.new(:dots => dots_array)
#
#     image = dotter.generate_image
#     image # Magick::Image instance containing transparent image with dots
#
# A Dot can be any object that responds to :x and :y methods. If :colorize in options is set to true and dot responds to :dot_color method, dot will be drawn with this color (color can be anything that is acceptable as a color in RMagick, usually RGB value, ie: "#ff0000". Dots are black by default)
#
# x and y coordinates represents the actual place, where the dot will be placed on image. If you have latitude and longitude coordinates you must convert it first. It's fairly easy with Dotter::Tile, which abstracts google maps tiles.
class Dotter::Dotter
  attr_accessor :dots, :colorize

  # ==== Parameters
  # options<Hash>::
  #
  # ==== Options
  # :dots<Enumerable>:: array of dots that should be displayed on the image
  # :width<Fixnum>:: tile width (default: 256)
  # :height<Fixnum>:: tile height (default: 256)
  # :radius<Fixnym>:: dot radius (default: 5)
  # :colorize<Boolean>:: if colorize is set to true and dot responds_to dot_color, dot is colored using that color. Otherwise it's black (default: true)
  def initialize(opts = {})
    @dots = opts.delete(:dots) || []
    @width = opts.delete(:width) || 256
    @height = opts.delete(:height) || 256
    @radius = opts.delete(:radius) || 5
    colorize = opts.delete(:colorize)
    @colorize = colorize.nil? ? true : colorize
  end

  # Tells if dots can be colored. If yes, dotter colors dot with anything that is returned by dot_color method.
  def colorize?
    @colorize
  end

  # Generate transparent image with dots
  def generate_image
    image = Magick::Image.new(@width, @height) do
      self.background_color = "transparent"
    end

    draw_dots(image)

    image
  end

private
  def draw_dots(image) #:nodoc
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
    color = if colorize? and dot.respond_to?(:dot_color) && !dot.dot_color.nil?
              dot.dot_color
            else
              "black"
            end
    gc.fill(color)
    gc.circle(dot.x, dot.y, dot.x - @radius + 1, dot.y)
  end
end

directory = File.expand_path(File.dirname(__FILE__))
require File.join(directory, 'dotter', 'dot')
require File.join(directory, 'dotter', 'lat_lng')
require File.join(directory, 'dotter', 'gmap')
require File.join(directory, 'dotter', 'tile')
require File.join(directory, 'dotter', 'point')

