class Host
  ##
  # initialize Host by user data, or default data
  #
  # default data sets host's ip address 127.0.0.1 without host name
  # data option - host ip address, host name
  #
  def initialize(ipaddress = '127.0.0.1', hostname = '')
    @ipaddress, @hostname = ipaddress, hostname
  end

  ##
  # return  compliance host ip address and host name (  example > 'server1'='192.168.1.100')
  def getinfo
    @info = "'" + @hostname.to_s + "'='" + @ipaddress.to_s + "'"
    @info
  end
end
