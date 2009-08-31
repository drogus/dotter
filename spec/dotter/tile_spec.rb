require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Dotter::Tile" do
  it "should generate tile image" do
    # i know that this isn't good spec, it's just to run code and see it if not fails
    # need to add more specs fot Tile
    tile = Dotter::Tile.new(Dotter::LatLng.new(0, 0), 0)
    tile.places = [Dotter::LatLng.new(0, 0)]
    tile.image.class.should == Magick::Image
    lambda { tile.image.to_blob }.should_not raise_error
  end
end
