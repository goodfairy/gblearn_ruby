class Droid < cpu
  attr_accessor :droidname 
  def initialize(name = 'r2d2')
    @droidname = droidname
  end
  
  def setupdroid(type, *language)
    @type = type
    
  end
  
  def communicate(withobject)
    initconnect(withobject)   
  end
  
  private
  
  def initconnect
    withobject.ishuman? ?  withobject.startconnect(translatehuman(inidata,ln)) : withobject.startconnect(inidata)
  end
  
  def translatehuman(data, ln = 'en')
    self.useln(data)
  end

end
  