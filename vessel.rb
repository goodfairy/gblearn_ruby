module Military
  attr_accessor :rocket,  :torpedo
end

module Cargo
  attr_accessor :hold,  :crane
end

class Vessel
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

supercargo = Abovewater.new('контейнеровоз', ['cargo'], 10)
supercargo.hold, supercargo.crane = false, true
puts supercargo.inspect

zernocargo = Abovewater.new('сухогруз ', ['cargo'], 40)
zernocargo.hold, zernocargo.crane = true, true
puts zernocargo.inspect

tankercargo = Abovewater.new('нефтяной танкер', ['cargo'], 50)
tankercargo.hold, tankercargo.crane = true, false
puts tankercargo.inspect

atomander = Underwater.new('подводная лодка', ['military'], 10000)
atomander.rocket, atomander.torpedo = true, false
puts atomander.inspect

rocketbot = Abovewater.new('ракетный крейсер', ['military'], 45)
atomander.rocket, atomander.torpedo = true, false
puts rocketbot.inspect

militarycargo = Abovewater.new('военный транспорт', ['cargo','military'], 150)
militarycargo.hold, militarycargo.crane = true, true
militarycargo.rocket, militarycargo.torpedo = true, false
puts militarycargo.inspect


class Fivable
  MAX_INSTANCES  = 5
  @instances_count = 0
  
  def self.inst_count
    @instances_count += 1
  end
  
  def initialize
   raise "No more than #{MAX_INSTANCES} instances allowed" if Fivable.inst_count> MAX_INSTANCES
  end
end

(1..7).each{ puts Fivable.new }


