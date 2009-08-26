require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Dotter" do
  it "should allow to pass dots in initializer" do
    dots = [Dot.new(1, 2), Dot.new(3, 4)]
    dotter = Dotter.new(:dots => dots)
    dotter.dots.length.should == 2
  end
end
