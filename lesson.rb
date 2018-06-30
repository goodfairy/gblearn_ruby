class Computer
    NAME = "Computer Class"
    def initialize(ip="127.0.0.1", dnsname ="")
        @ip, @dnsname =  ip, dnsname
    end
    def getInfo
        @info = "'"+@dnsname.to_s+"'='"+@ip.to_s+"'" 
        return @info
    end
end

class Host < Computer
    NAME = "Host Controller Class"
    def initialize(ip="127.0.0.1", dnsname ="", service="")
        super(ip, dnsname)
        @service  =  service
    end
    def getInfo
        super
        @info = @info + " Servise: ("+@service.to_s+")" 
        return @info
    end
end

class Customer
    NAME = "Customer Class"
    def initialize(usrName="Иван", usrSName="Ивановов", usrMName="Иванович", usrOccupation = "разнорабочий")
      @usrName, @usrSName, @usrMName, @usrOccupation = usrName, usrSName, usrMName, usrOccupation ; 
    end
    def profession
        puts @usrOccupation
    end
    def fio
        puts @usrName.to_s + " " + @usrSName.to_s + " " + @usrMName.to_s
    end
end

class Network
    NAME = "Network Class"
    def initialize(ip="127.0.0.1", hostname ="")
        @ip, @hostname =  ip, hostname
    end
end

#usr = Customer.new()
#usr.fio
#usr.profession

#comp = Computer.new("192.168.0.1", "amapc")
#puts comp.getInfo 

hst = Host.new("192.168.0.1", "amapc", "web-server")
puts hst.getInfo 