class Dopobj
  def ishuman?
    false
  end
  def startconnect(idata)
    true
  end
end


class Droid
  attr_accessor :droidname 
  def initialize(name = 'r2d2')
    @droidname = droidname
    @initdata = '01010011000111100010101001111100110001010010000011111110010100100101001000111'
  end
  
  def setupdroid(type, *language)
    @type = type
  end
  
  def communicate(withobject)
    initconnect(withobject)   
  end
  
  private
  
  def initconnect(withobject)  
    withobject.ishuman? ?  withobject.startconnect(translatehuman(@initdata,ln)) : withobject.startconnect(@initdata)
  end
  
  def translatehuman(data, ln = 'en')
    self.useln(data)
  end

end
  