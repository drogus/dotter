require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Dotter::Dot" do
  it "should allow to pass coordinates" do
    dot = Dotter::Dot.new(1, 2)
    dot.x.should == 1
    dot.y.should == 2
  end
end
