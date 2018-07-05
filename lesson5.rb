require_relative 'usercls.rb'
require_relative 'hellcls.rb'
require_relative 'millcls.rb'

# 1. Создайте класс Hello, при создании объекта которого конструктору можно было бы передавать параметр Hello.new('world').
# При вызове метода say этого объекта hello.say или при выводе объекта методом puts должна выводиться фраза 'Hello world!',
# где подстрока world задается параметром конструктора. см hellcls.rb

#uselessobj = Hello.new('World')
#puts uselessobj.say
#puts
#puts 'press enter'
#gets

##
# 2. Создайте класс пользователя User, который бы при создании объекта позволял задавать фамилию, имя и отчество.
#   Метод должен реализовывать методы чтения и установки фамилии, имени и отчества. Кроме того, объект класса пользователя должен:
# * позволять сложение со строкой;
# * вызывать метод full_name, который возвращает строку с именем пользователя;
# * поддерживать метод, который возвращает имя, фамилию и отчество в виде массива.

#uselesuser = User.new('ask')
#uselesuser = User.new('Алексей Майсурадзе Аркадьевч')
#puts uselesuser.full_name               # возвращает строку с именем пользователя
#puts uselesuser.fioarray                # возвращает имя, фамилию и отчество в виде массива.
#puts uselesuser.name('name')            # читаем имя 
#uselesuser.name('sname','Петров')       # меняем фамилию
#puts uselesuser.full_name               # возвращает строку с именем пользователя
#puts uselesuser.to_s + ' - Супергерой!' # сложили со строкой
#puts
#puts 'press enter'
#gets

# 3. Создайте класс Group, конструктор которого может принимать произвольное количество объектов класса User
# (из предыдущего задания). Реализуйте вывод списка пользователей с использованием класса Group.

#uselesuserarray =[]
#['Иванов Иван Иванович', 'Петров Петр Петрович', 'Сидоров Сидр Сидрович'].each {|usr| uselesuserarray << User.new(usr)}
#uselesusergroup = Group.new('uselesusergroup', uselesuserarray)
#uselesusergroup.list_user('0100')
#puts 'press enter'
#gets


# 5. *Пусть имеется фабрика, которая выпускает детские игрушки: плюшевый медвежонок, мяч, кубики. Создайте класс, который моделирует работу фабрики.
# Реализуйте в классе подсчет каждого созданного объекта-игрушки (медвежонок, мяч, кубики). Используйте для учета классовые переменные.

#toy = Mill.new('uselesmill')
#toy.makeproduct('ball',5)
#puts toy.millstat

# 4. *Создайте класс Settings, конструктор которого принимает блок и позволяет установить произвольные параметры setting = Settings.new { |s| s.hello = 'world' }.
# Имена параметров вида s.hello могут быть проивольными. Заданные в блоке конструктора значения должны быть доступны через одноименные методы объекта setting.hello.
# Обращение к параметру, который не был задан при создании объекта, должно приводить генерации исключительной ситуации.

    class Bl_value
        def self.typesafe_accessor(name)
            #define_method(name) { instance_variable_set("@#{name}", nil) }
            puts 'ok'
            self.class.send(:define_method, "@#{name}".to_sym) { instance_variable_set('@#{name}'.to_s,nil) }
        end
        #
        #def initialize 
        #    self.class.send(:define_method, "hello".to_sym) { instance_variable_set('@hello','x') }
        #end

    end
    
        objval = Bl_value.new
        puts objval.hello
    
class Settings < Bl_value
    



    def initialize(&block)
        userproc = block
        objval = Bl_value.new(block)
        puts objval.hello
        #instance_variable_set()
        #catch(objval) userproc
        #yield(objval)
        #user_metod = proc &block
        #puts user_metod.binding
        
        
   
        #@bb = block.to_s  { |item| puts item }
        #@user_bloc = yield if block_given?
        #@user_bloc.call
        #if block_given? then each { |element| puts (element) } end
        #define_metod @data_processor. do
        #@data_processor.call
        #end    
    end

end

setting = Settings.new { |s| s.hello = 'world' }
#setting.hello