require_relative 'pintcls.rb'

point_one = Point.new([2,2])
point_two = Point.new([0,0])
ptp_line = Line.new(point_one, point_two)
puts ptp_line.linelenght
puts ptp_line.linelenght(4)
