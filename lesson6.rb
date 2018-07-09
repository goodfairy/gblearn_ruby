# require_relative 'perscls.rb'
class Person
  attr_accessor :name, :sname, :mname 
  def initialize(fio)
    personfio = fio.to_s.split
    @name, @sname, @mname= personfio[0], personfio[1], personfio[2] 
  end
  private_class_method :new
end

class User < Person
  public_class_method :new
end

class Moderator < User
  
end

class Admin < Moderator
  
end

pers = Admin.new('Изя Петров Чингачкугович')
puts pers.mname