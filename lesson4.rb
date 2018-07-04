require_relative 'usercls.rb'

puts "1. Дан массив ['cat', 'dog', 'tiger']. Нужно вернуть массив, состоящий только из элементов, где встречается символ t."
puts %w[cat dog tiger].select { |item| item.include?('t') }
puts
puts "2. Дан массив ['cat', 'dog', 'tiger']. Изменить его так, чтобы все элементы были написаны заглавными буквами,"
puts 'а потом – в оригинальном виде. Записать все в одну строчку.'
%w[cat dog tiger].each { |item| puts item.capitalize }.each { |item| puts item }

##
# 3. Создайте класс пользователя User, объекты которого сохраняют имя пользователя и его оценку.
# Запросите в консоли при помощи метода gets имя и оценку пользователя.
# Реализуйте опрос до тех пор, пока не будет введена корректная оценка в интервале от 1 до 5.
##testuser = User.new('Вася', 'ask')
##puts testuser.info

puts
puts '4. *Дан массив %i(first second third). Превратите его в хэш {first: 1, second: 2, third: 3}.6'
puts %i(first second third).map(&:to_s).zip(1..3).to_h

puts
puts '5. *Реализуйте полный аналог метода map. Назовите его my_map.  Для тестов берем array, hash, proc'
puts "hashtodo = { 1' => 1, '2' => 2, '3' => 3 }"
puts 'arraytodo = [ 1,  2,  3]'
puts 'double = Proc.new {|num| num * 2}'
class Object
    def my_map(&block)
      outarr = []
      if block_given? then self.each { |element|  outarr.push(yield(element)) }
      else outarr = to_enum :my_map end
      outarr
    end
end

hashtodo = { '1' => 1, '2' => 2, '3' => 3 }
arraytodo = [ 1,  2,  3]
double = Proc.new {|num| num * 2}

p arraytodo.map(&double)
p arraytodo.my_map(&double)
p hashtodo.map(&double)
p hashtodo.my_map(&double)
puts
p arraytodo.map{ |i| i*3}
p arraytodo.my_map{|i| i*3}
p hashtodo.map{|i| i*3}
p hashtodo.my_map{|i| i*3}
puts
p arraytodo.map{ |i| "text" }
p arraytodo.my_map{ |i| "text" }
p hashtodo.map{ |i| "text" }
p hashtodo.my_map{ |i| "text" }