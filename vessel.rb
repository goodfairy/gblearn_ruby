require_relative 'limit.rb'

module Fivablev2
  MAX_INSTANCES2  = 3
  @@instances_count = Hash.new(0)
  
  class TooManyObj < RuntimeError
    def initialize(counter)
      super "No more than #{counter} instances allowed"
    end
  end
    
  def self.included(base)
    def base.new
      @@instances_count[self] += 1
      p @@instances_count
      raise TooManyObj.new(@@instances_count[self]) if @@instances_count[self] > MAX_INSTANCES2
      super
    end
  end
end

module Military
  attr_accessor :rocket,  :torpedo
end

module Cargo
  attr_accessor :hold,  :crane
end

class Vessel
  prepend Fivable
  include Fivablev2
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
