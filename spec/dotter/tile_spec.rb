require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

def stub_point(point, x, y)
  stub(point).x=
  stub(point).x { x }
  stub(point).y=
  stub(point).y { y }
end

describe "Dotter::Tile" do
  it "should generate tile image" do
    # i know that this isn't good spec, it's just to run code and see it if not fails
    # need to add more specs fot Tile
    tile = Dotter::Tile.new(Dotter::LatLng.new(0, 0), 0)
    tile.locations = [Dotter::LatLng.new(0, 0)]
    tile.image.class.should == Magick::Image
    lambda { tile.image.to_blob }.should_not raise_error
  end

  describe "Converting" do
    before(:each) do
      @tile = Dotter::Tile.new(Dotter::LatLng.new(0, 0), 1)
      @places = [Dotter::LatLng.new(0, 0), Dotter::LatLng.new(-85.1, 180)]
      @tile.locations = @places
    end

    it "should convert places to points" do
      points = @tile.locations_as_points
      points.should have(2).items
      points.first.x.should == 0
      points.first.y.should == 0
      points[1].x.should == 256
      points[1].y.should == 256
    end

    it "should set x and y in current points if points responds_to x= and x=" do
      stub_point(@tile.locations[0], 0, 0)
      stub_point(@tile.locations[1], 111, 111)

      @tile.generate_xy_coordinates!
    end
  end

end
