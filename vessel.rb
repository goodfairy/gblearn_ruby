class Vessel
  attr_accessor :waterfull, :name

end

module Military
  attr_accessor :rocket,  :torpedo
end

module Citezen
  attr_accessor :hold,  :crane
end

module Fivable
  attr_accessor :itemnum
end


class Underwater < Vessel
  
end

class Abovewater < Vessel
  
end
