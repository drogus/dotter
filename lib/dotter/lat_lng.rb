class Dotter::LatLng
  attr_accessor :lat, :lng
  alias latitude lat
  alias longitude lng

  def initialize(lat, lng)
    @lat, @lng = lat, lng
  end
end
