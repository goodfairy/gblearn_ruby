module Fivable
  MAX_INSTANCES  = 10
  @instances_count = 0
  
  def self.inst_count
    @instances_count += 1
  end
  
  def initialize(*arg)
    raise "No more than #{MAX_INSTANCES} instances allowed" if Fivable.inst_count> MAX_INSTANCES
    super
  end
  
  def new
    self.initialize
  end
end


