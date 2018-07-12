require_relative 'limit.rb'

module Military
  attr_accessor :rocket,  :torpedo
end

module Cargo
  attr_accessor :hold,  :crane
end

class Vessel
  prepend Fivable
  attr_accessor :name
  def initialize(name = '', type)
    type.each{ |type| instance_eval('extend(' + type.to_s.capitalize+')') }
    @name = name
  end
end

class Underwater < Vessel
  attr_accessor :underdepth
  
  def initialize(name = '', type=nil, underdepth = 0)
    super(name, type)
    @underdepth = underdepth
  end
end

class Abovewater < Vessel
  attr_accessor :aboveheight

  def initialize(name = '', type = nil, aboveheight=0)
    super(name, type)
    @aboveheight = aboveheight
  end
end
