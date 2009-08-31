require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Dotter::GMap" do
  it "should allow to convert coordinates to point on map" do
    Dotter::GMap.latlng_to_pixel(Dotter::LatLng.new(0, 0), 0).should == Dotter::Point.new(128, 128)
  end
end
