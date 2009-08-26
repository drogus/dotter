require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Dotter::Dot" do
  it "should allow to pass coordinates" do
    dot = Dotter::Dot.new(1, 2)
    dot.x.should == 1
    dot.y.should == 2
  end

  it "should allow to subtract one dot from another" do
    dot = Dotter::Dot.new(10, 5)
    dot2 = Dotter::Dot.new(5, 2)
    result = dot - dot2

    result.x.should == 5
    result.y.should == 3
  end
end
