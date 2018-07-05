require_relative 'usercls.rb'
require_relative 'hellcls.rb'
require_relative 'millcls.rb'

# 1. Создайте класс Hello, при создании объекта которого конструктору можно было бы передавать параметр Hello.new('world').
# При вызове метода say этого объекта hello.say или при выводе объекта методом puts должна выводиться фраза 'Hello world!',
# где подстрока world задается параметром конструктора. см hellcls.rb

#uselessobj = Hello.new('World')
#uselessobj.say
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
uselesuser = User.new('Алексей Майсурадзе Аркадьевч')
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


toy = Mill.new('uselesmill')
toy.makeproduct('ball',5)
puts toy.millstat

abort
