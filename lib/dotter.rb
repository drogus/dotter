directory = File.expand_path(File.dirname(__FILE__))
 
require File.join(directory, 'dotter', 'dot')

class Dotter
  attr_accessor :dots

  def initialize(opts)
    @dots = opts.delete(:dots)
  end
end
