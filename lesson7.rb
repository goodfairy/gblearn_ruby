# Пусть имеется хэш { red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый' }.
# Првератите его в хэш { 'красный' => 'red', 'оранжевый' => 'orange', 'желтый' => 'yellow', 'зеленый' => 'green', 'голубой' => 'blue', 'синий' => 'indigo', 'фиолетовый' => 'violet' }.

ithash = { red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый' }
puts ithash.values.zip(ithash.keys.map(&:to_s)).to_h
puts

# 2. Преобразуйте массив вида %w[first second third] в хэш вида {first: 'Fst (1)', second: 'Snd (2)', third: 'Trd (3)'}.
# Выражение преобразования должно быть однострочным.
inarray = %w[first second third]
puts inarray.zip(inarray.map{ | item , count | item[0..0].capitalize.to_s+item[-2..-1].to_s+"(#{inarray.index(item)+1})" }).to_h
puts

# 2. Имеется два массива %w[red orange yellow green gray indigo violet] и %w[красный оранжевый желтый зеленый голубой синий фиолетовый].
# Создайте из них хэш {red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый'}
firstarr = %w[red orange yellow green gray indigo violet]
secondarr = %w[красный оранжевый желтый зеленый голубой синий фиолетовый]
puts firstarr.zip(secondarr).to_h
puts

# 3. Пусть есть диапазон от 1 до 9 — (1...10). Преобразуйте его в массив из трех подмассивов [[1, 2, 3], [4, 5, 6], [7, 8, 9]].
# (1...10).each { |item| puts item
# некрасиво
#newarr =  []
#(1..3).to_a.each { |i| newarr[i-1] = (1...10).to_a[(i-1)*3, 3].to_a }
#puts newarr.inspect
# красиво, но все равно не красиво
puts (1...10).to_a.map { | e | [e] }.map! { |e| Array.new(3){ |i| (i+1)+(((e.join.to_s.to_i-1)/3)*3) }  }.uniq.inspect
puts

taskdata = IO.read('task7.txt')

taskdata = taskdata.scan(/[^,!*:?.";\n'\d\\{}()<=>\[\]%]/).join('').split(' ').reject!{ | elem | elem.size<5 }.sort!
puts taskdata.size, taskdata.inspect
puts

taskdata = IO.read('task7.txt')
taskdata = taskdata.scan(/[^,!*:?.";\n'\d\\{}()<=>\[\]%]/).join('').split(' ').reject!{ | elem | elem[0]!='и' }.uniq!.sort_by{ | elem | elem.size }
puts taskdata.inspect

def findfiles(dirfist = Dir.pwd)
    list = (Dir.entries(dirfist)).delete_if { |dir| dir[0] == "." }
    rbcount = 0
    list.each { |elm | rbcount = rbcount + findfiles(dirfist+"/"+elm) if File::directory?(dirfist+"/"+elm) }
    rbcount + list.select { |elm | elm.index(".rb") }.size   
end

puts findfiles
puts
puts 'Hello world!'.split('').inspect


require 'open-uri'
require 'nokogiri'
File.write(Dir.pwd+'/string.txt', Nokogiri::HTML(open('http://ruby-doc.org/core-2.4.2/String.html')).css('#method-list-section').css('li').css('a').inject(''){ | wrstr, showing, |  wrstr = wrstr + showing.text + "\n" })


