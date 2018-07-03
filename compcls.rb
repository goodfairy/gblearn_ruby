class Computer < Host
  ##
  # initialize Computer by user data, or default data
  #
  # default data sets Computer's ip address 127.0.0.1 without host name and default mode pc (personal computer)
  # data option - Computer ip address, Computer name,Computer mode
  #
  def initialize(ipaddress = '127.0.0.1', dnsname = '', service = 'pc')
    super(ipaddress, dnsname)
    @service = service
  end

  ##
  # return  Computer host ip address and host name and mode  (  example > 'server1'='192.168.1.100' Servise: (RDP Server 1C 8.2)  )
  def getinfo
    super
    @info = @info + ' Servise: (' + @service.to_s + ')'
    @info
  end
end
