require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Dotter::Point" do
  it "should allow to pass coordinates" do
    point = Dotter::Point.new(1, 2)
    point.x.should == 1
    point.y.should == 2
  end

  it "should allow to subtract one point from another" do
    point = Dotter::Point.new(10, 5)
    point2 = Dotter::Point.new(5, 2)
    result = point - point2

    result.x.should == 5
    result.y.should == 3
  end
  
  it "should allow to add one point to another" do
    point = Dotter::Point.new(10, 5)
    point2 = Dotter::Point.new(5, 2)
    result = point + point2

    result.x.should == 15
    result.y.should == 7
  end

  it "should allow to compare points" do
    point = Dotter::Point.new(1, 1)
    point2 = Dotter::Point.new(1, 1)

    point.should == point2
  end
end
