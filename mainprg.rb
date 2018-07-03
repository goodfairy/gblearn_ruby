require_relative 'hostcls.rb'
require_relative 'compcls.rb'
require_relative 'netwcls.rb'
require_relative 'usercls.rb'

usr = User.new
# 2. Используя метод colors из предыдущего задания, создайте программу, генерирующую случайный цвет
puts 'Случайный цвет: ' + usr.colors(usr.getrandomcolor)
puts # пропустим строчку
# 3. Создайте программу, которая запрашивает у пользователя номер цвета и возвращает название цвета. Если цвет не верный, выведите сообщение об ошибке.
puts usr.asknum_getcolor
puts # пропустим строчку
# 4. *Запросите у пользователя название цвета и верните номер цвета из первого задания.
puts usr.askcolor_getnum
