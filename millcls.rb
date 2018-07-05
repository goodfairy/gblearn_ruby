class Unitprod
  @unit_count = 0

  def self.unitcount
    @unit_count += 1
  end
  
  def initialize()
    Unitprod.unitcount
  end
end

class Product < Unitprod
  attr_reader :ptype

  def initialize(ptype)
    super()
    @ptype = ptype
  end
  
end

class Mill < Product
  @mill_count = { :bear => 0, :ball => 0, :cube => 0}
  class << self
    def millcount(ptype, step)
      @mill_count[ptype.to_sym] = @mill_count[ptype.to_sym] + step
    end
    
    def stat(type = nil)
      type.nil? ? @mill_count : ( type == 'sum' ? @mill_count.values.reduce(:+) : @mill_count[type.to_sym] )
    end
  end
  
  def initialize(mill_name)
    @mill_name = mill_name
    @mill_products =[]
  end
  
  def makeproduct(type, partcount = 1) 
    @mill_products.push(partcount.times{Product.new(type)})
    Mill.millcount(type, partcount)
  end
  
  def millstat(type = nil)
    Mill.stat(type)
  end
  
end