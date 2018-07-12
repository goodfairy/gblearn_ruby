require_relative 'limit.rb'

class User
prepend Fivable
end

16.times{ User.new }

