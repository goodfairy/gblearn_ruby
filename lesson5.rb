require_relative 'usercls.rb'
require_relative 'hellcls.rb'
require_relative 'millcls.rb'

# 1. Создайте класс Hello, при создании объекта которого конструктору можно было бы передавать параметр Hello.new('world').
# При вызове метода say этого объекта hello.say или при выводе объекта методом puts должна выводиться фраза 'Hello world!',
# где подстрока world задается параметром конструктора. см hellcls.rb

uselessobj = Hello.new('World')
puts uselessobj.say
puts
puts 'press enter'
gets

##
# 2. Создайте класс пользователя User, который бы при создании объекта позволял задавать фамилию, имя и отчество.
#   Метод должен реализовывать методы чтения и установки фамилии, имени и отчества. Кроме того, объект класса пользователя должен:
# * позволять сложение со строкой;
# * вызывать метод full_name, который возвращает строку с именем пользователя;
# * поддерживать метод, который возвращает имя, фамилию и отчество в виде массива.

uselesuser = User.new('ask')
puts uselesuser.full_name               # возвращает строку с именем пользователя
puts uselesuser.fioarray                # возвращает имя, фамилию и отчество в виде массива.
puts uselesuser.name('name')            # читаем имя 
uselesuser.name('sname','Петров')       # меняем фамилию
puts uselesuser.full_name               # возвращает строку с именем пользователя
puts uselesuser.to_s + ' - Супергерой!' # сложили со строкой
puts
puts 'press enter'
gets

# 3. Создайте класс Group, конструктор которого может принимать произвольное количество объектов класса User
# (из предыдущего задания). Реализуйте вывод списка пользователей с использованием класса Group.

uselesuserarray =[]
['Иванов Иван Иванович', 'Петров Петр Петрович', 'Сидоров Сидр Сидрович'].each {|usr| uselesuserarray << User.new(usr)}
uselesusergroup = Group.new('uselesusergroup', uselesuserarray)
uselesusergroup.list_user('0100')
puts 'press enter'
gets

# 5. *Пусть имеется фабрика, которая выпускает детские игрушки: плюшевый медвежонок, мяч, кубики. Создайте класс, который моделирует работу фабрики.
# Реализуйте в классе подсчет каждого созданного объекта-игрушки (медвежонок, мяч, кубики). Используйте для учета классовые переменные.

toy = Mill.new('uselesmill')
toy.makeproduct('ball',5)
puts toy.millstat
toy.makeproduct('bear',3)
puts toy.millstat
toy.makeproduct('cube',12)
puts toy.millstat

puts toy.millstat('ball')
puts toy.millstat('bear')
puts toy.millstat('cube')
puts toy.millstat('sum')

puts 'press enter'
gets

# 4. *Создайте класс Settings, конструктор которого принимает блок и позволяет установить произвольные параметры setting = Settings.new { |s| s.hello = 'world' }.
# Имена параметров вида s.hello могут быть проивольными. Заданные в блоке конструктора значения должны быть доступны через одноименные методы объекта setting.hello.
# Обращение к параметру, который не был задан при создании объекта, должно приводить генерации исключительной ситуации.

class Bl_value

    def method_missing(method, value)
        mname = method.to_s.scan(/[^=]/).join     
        self.class.send(:define_method,  "#{mname}".to_sym) { instance_variable_set("@#{mname}", value ) }
        self.class.send(:define_method,  "#{mname}".to_sym) { instance_variable_get("@#{mname}"        ) }
        self.class.send(:define_method, "#{mname}=".to_sym) { |new_value| instance_variable_set("@#{mname}".to_sym, new_value) }
    end   
end
    
class Settings < Bl_value
    
    def method_missing(method, *args)
        raise "Undefined method #{method} for class Settings"
    end
    
    def initialize(&block)
        userproc = block
        objval = Bl_value.new
        yield(objval)
        userproc.call(objval)
    end
end

setting = Settings.new { |s| s.hello = 'world' }
setting.hello = 'world'
puts setting.hello
setting.hello = 'useless'
puts setting.hello
setting.hello = 'goodbay'
puts setting.hello
# Обращение к параметру, который не был задан при создании объекта, должно приводить генерации исключительной ситуации.
setting.bye = 'good'