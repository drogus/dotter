require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Dotter::LatLng" do
  it "should allow to pass latitude and longitude in initialize" do
    latlng = Dotter::LatLng.new(10.0, 20.0)
    latlng.lat.should == 10.0
    latlng.lng.should == 20.0
  end
end
