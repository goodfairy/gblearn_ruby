require 'ipaddr'
class Network
  ##
  # initialize Network by user data, or default data
  #
  # default data sets Network's ip address192.168.0.0 and network mask 24
  # data option - network ip address, network mask
  #
  def initialize(address = '192.168.0.0', mask = '24')
    @net_str = address.to_s + '/' + mask.to_s
    @net = IPAddr.new(@net_str)
  end
end
