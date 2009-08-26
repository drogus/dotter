$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'dotter'
require 'spec'
require 'spec/autorun'

Spec::Runner.configure do |config|
   config.mock_with :rr
end

def be_transparent
  simple_matcher("be transparent") { |actual| 
    actual.opacity == Magick::TransparentOpacity
  }
end
