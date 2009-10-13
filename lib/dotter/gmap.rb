class Dotter::GMap

  # translate given coordinates to pixels on google map
  # with given zoom. implementation is based on: http://www.usnaviguide.com/google-tiles.htm
  #
  # returns point relative to map (not tile!) beginning (0, 0)
  def self.latlng_to_pixel(latlng, zoom)
    c = 256
    bc = 2 * Math::PI
    wa = Math::PI / 180
    cp = 2 ** (zoom + 8)
    pixLngDeg = cp / 360.0
    pixLngRad = cp / bc
    bmO = cp / 2

   point = Dotter::Point.new(0, 0)

   e = Math.sin(latlng.lat * wa)
   e = 0.9999 if e > 0.9999
   e = -0.9999  if e < -0.9999

   point.x = (bmO + latlng.lng * pixLngDeg).floor
   point.y = (bmO + 0.5 * Math.log((1 + e) / (1 - e)) * -1 * pixLngRad).floor
   point
  end
end
