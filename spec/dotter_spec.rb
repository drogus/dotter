require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Dotter" do
  it "should allow to pass dots in initializer" do
    dots = [Dotter::Dot.new(1, 2), Dotter::Dot.new(3, 4)]
    dotter = Dotter.new(:dots => dots)
    dotter.dots.length.should == 2
  end

  it "should generate blank image without error if there is no dots" do
    dotter = Dotter.new
    lambda { dotter.generate_image }.should_not raise_error
  end

  describe "generated image" do
    before(:each) do
      @dotter = Dotter.new(:dots => [Dotter::Dot.new(10, 10), Dotter::Dot.new(20, 20)])
      @image = @dotter.generate_image
    end

    it "should have image class" do
      @image.class.should == Magick::Image
    end

    it "there should be transparent pixel" do
      @image.pixel_color(0, 0).should be_transparent
    end

    it "dot should not be transparent" do
      @image.pixel_color(10, 10).should_not be_transparent
    end
  end
end
