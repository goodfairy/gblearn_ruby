class Point
  attr_reader :x
  attr_reader :y
  ##
  # initialize Point by user data, or default data
  #
  # default data sets point x,y = 0,0
  # data option - host ip address, host name
  #
  def initialize(point_xy = [0, 0 ])
    @x, @y = point_xy[0], point_xy[1]
    @point_xy = { :x => point_xy[0], :y => point_xy[1] }
  end

  def chxyattr
    @x, @y = @point_xy[:x], @point_xy[:y]
  end
  
  ##
  # return point
  def getpoint(type=nil)
    type.nil? ? @point_xy : @point_xy[type.to_sym] 
  end
  
  ##
  # set point x,y
  #
  def setpoint(point_x, point_y)
    @point_xy[:x], @point_xy[:y] = point_x, point_y
    chxyattr
  end
 
  ##
  # set point x or y
  #  
  def setcoord(type , value)
    @point_xy[type.to_sym] = value
    chxyattr
  end
end

class Line
    
  def initialize(point_one, point_two)
    @point_one, @point_two = point_one, point_two
  end
  
  def linelenght(roundsign = 0)
    ll =  Math.sqrt( ((@point_two.x-@point_one.x)**2)+((@point_two.y-@point_one.y)**2) ) 
    roundsign.zero? ? ll : sprintf("%.#{roundsign}f", ll)
  end
end