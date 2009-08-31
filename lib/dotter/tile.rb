# class abstracting google maps' tiles (squares that are loaded as parts of the map)
# more on tiles and how google maps works can be found here:
# http://code.google.com/apis/maps/documentation/overlays.html#Google_Maps_Coordinates
class Dotter::Tile
  attr_accessor :zoom, :start, :places
  def initialize(latlng, zoom)
    @zoom = zoom.to_i
    @start = Dotter::GMap.latlng_to_pixel(latlng, zoom)
  end

  # method that takes collection of objects responding to latitude and longitude
  # methods and converting it to points on current tile
  def places_as_points
    places.map do |place|
      place = Dotter::GMap.latlng_to_pixel(Dotter::LatLng.new(place.latitude, place.longitude), zoom)
      place = place - start # place is relative to big map, let's make it relative to start of tile
      place
    end
  end

  # generate tile image with Dotter
  def image
    dotter = Dotter::Dotter.new(:dots => places_as_points)
    img = dotter.generate_image
    img.format = "png"
    img
  end
end


