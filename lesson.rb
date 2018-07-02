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

class Customer
  ##
  # initialize Customer by user data, or default data
  #
  # default data - 'Иван Иванов Иванович разнорабочий'
  # data option - user name, user surname, user midle name, user occupation
  #
  def initialize(usr_name = 'Иван', usr_sname = 'Иванов', usr_mname = 'Иванович', usr_occupation = 'разнорабочий')
    @usr_name, @usr_sname, @usr_mname, @usr_occupation = usr_name, usr_sname, usr_mname, usr_occupation
  end

  ##
  # return user occupation ( example > разнорабочий )
  #
  def profession
    @usr_occupation
  end

  ##
  # Return user's name surname middle name  ( example > Иванов Иван Иванович )
  #
  def fio
    @usr_sname.to_s + ' ' + @usr_name.to_s + ' ' + @usr_mname.to_s
  end
end

usr = Customer.new
puts usr.fio
puts usr.profession
