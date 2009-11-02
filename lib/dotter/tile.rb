# Dotter::Tile is abstracting google maps' tiles (squares, usually 256x256, that are loaded as parts of the map).
# 
# More on tiles and how google maps works can be found here: http://code.google.com/apis/maps/documentation/overlays.html#Google_Maps_Coordinates
#
# ==== Usage
#
# To generate a tile you must give upper left corner of a tile and zoom.
#
#     tile_start = Dotter::LatLng.new(tile_start_latitude, tile_start_longitude)
#     tile = Dotter::Tile.new(tile_start, zoom)
#
#     tile.locations = locations_array # locations should respond_to latitude and longitude
#
#     tile.image # generates RMagick::Magick image with "png" format set
#
# You can also use tile in Dotter::Dotter explicitly (tile.image is a simple helper, but if you want to set some specific options you will have to do that this way):
#     dots = tile.generate_xy_coordinates!
#     dotter = Dotter::Dotter.new(:dots => dots)
#     dotter.generate_image
#
# It passes locations changed into points relative to current tile's start.
#
class Dotter::Tile
  attr_accessor :zoom, :start, :locations, :dots
  def initialize(latlng, zoom)
    @zoom = zoom.to_i
    @start = Dotter::GMap.latlng_to_pixel(latlng, @zoom)
  end

  # Method that takes loactions passed to Tile and converts them into points with x an y relative to tile start
  # 
  # ==== Returns
  # Array[~x, ~y]:: points array
  def locations_as_points(options = {})
    points = []
    locations.each do |location|
      latlng = Dotter::LatLng.new(location.latitude, location.longitude)
      point = Dotter::GMap.latlng_to_pixel(latlng, zoom)
      point = point - start # location is relative to big map, let's make it relative to start of tile
      if block_given?
        yield(point, location)
      else
        points << point
      end
    end
    points
  end

  # Method sets x and y coordinates for each place
  #
  def generate_xy_coordinates!
    locations_as_points do |point, location|
      location.x = point.x
      location.y = point.y
    end
    @dots = locations
  end

  # Generate tile image with Dotter
  def image
    dotter = Dotter::Dotter.new(:dots => @dots || locations_as_points)
    img = dotter.generate_image
    img.format = "png"
    img
  end
end
