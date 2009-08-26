require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Dotter" do
  it "should allow to pass dots in initializer" do
    dots = [Dot.new(1, 2), Dot.new(3, 4)]
    dotter = Dotter.new(:dots => dots)
    dotter.dots.length.should == 2
  end

  describe "generated image" do
    before(:each) do
      @dotter = Dotter.new(:dots => [Dot.new(10, 10), Dot.new(20, 20)])
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
