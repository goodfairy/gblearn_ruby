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

# 4. Возьмите текст этого задания и извлеките из него все слова, количество символов в которых больше 5. Подсчитайте количество слов и выведите их алфавитном порядке.
taskdata = IO.read('task7.txt').encode!('UTF-8', 'UTF-8', :invalid => :replace).scan(/[^,!*:?.";\n'\d\\{}()<=>\[\]%]/).join('').split(' ').reject!{ | elem | elem.size<5 }.sort!
puts "количество символов в которых больше 5 - #{taskdata.size}"
puts taskdata.inject(''){|str, elm| str = str + elm.to_s +  ' ' }
puts

# 5. Возьмите текст этого задания и извлеките из него все слова, которые начинаются с символа 'и'.
# Сформируйте из них список уникальных слов и выведите их в порядке увеличения количества символов в слове.
puts "список уникальных слов на (и) в порядке увеличения количества символов в слове"
taskdata = IO.read('task7.txt').encode!('UTF-8', 'UTF-8', :invalid => :replace)
puts taskdata.scan(/[^,!*:?.";\n'\d\\{}()<=>\[\]%]/).join('').split(' ').reject!{ | elem | elem[0]!='и' }.uniq!.sort_by{ | elem | elem.size }.inject(''){|str, elm| str = str + elm.to_s +  ' ' }
puts

#6. *Разработайте программу, которая подсчитывает количество файлов с расширением .rb в текущей папке, включая все вложенные подпапки.
def findfiles(dirfist = Dir.pwd)
    list = (Dir.entries(dirfist)).delete_if { |dir| dir[0] == "." }
    rbcount = 0
    list.each { |elm | rbcount = rbcount + findfiles(dirfist+"/"+elm) if File::directory?(dirfist+"/"+elm) }
    rbcount + list.select { |elm | elm.index(".rb") }.size   
end

puts "В текущей директории и ее поддиректориях (#{Dir.pwd}) #{findfiles} файлов с расширением .rb"
puts

# 7. *Строку 'Hello world!' преобразуйте в ["H", "e", "l", "l", "o", " ", "w", "o", "r", "l", "d", "!"]. Выражение преобразования должно быть однострочным.
puts 'Hello world!'.split('').inspect
puts

# 8. *Со страницы документации, посвященной классу String языка Ruby (например, http://ruby-doc.org/core-2.4.2/String.html) извлеките список методов.
# Сохраните полученный список в файл string.txt.

require 'open-uri' # gem instal open-uri
require 'nokogiri' # gem instal nokogiri
# если они вам оч не нравятся, то комментим первый вариант
require 'net/http'

#File.write(filename1, Nokogiri::HTML(open('http://ruby-doc.org/core-2.4.2/String.html')).css('#method-list-section').css('li').css('a').inject(''){ | wrstr, showing, |  wrstr = wrstr + showing.text + "\n" })

#варик 1
#куда пишем
filename = Dir.pwd+'/string_nice.txt'
# забираем страничку
page = Nokogiri::HTML(open('http://ruby-doc.org/core-2.4.2/String.html'))
# слегка парсим                                             # формируем строку для записи, хотя конечно можно и прям массивом записать
wrstr = page.css('#method-list-section').css('li').css('a').inject(''){ | str, showing, |  str = str + showing.text + "\n" }
# Пишем в файл
File.write(filename, wrstr )
puts "Записан файл: #{filename}"



#File.write(filename2,  Net::HTTP.get(URI('http://ruby-doc.org/core-2.4.2/String.html')).split('method-list-section')[1].split('</ul>')[0].split('<ul class="link-list">')[1].split(' ').reject{ |v| v == '<li><a' }.map {|v| v.split('>')[1].split('<')[0] }.compact.inject(''){ | wrstr, elm, |  wrstr = wrstr + elm.to_s + "\n" } )

#варик 2, тут я уже хотел спать, будет страшно
#куда пишем второй файл
filename = Dir.pwd+'/string_bad.txt'
# забираем страничку
page = Net::HTTP.get(URI('http://ruby-doc.org/core-2.4.2/String.html'))
# слегка парсим                                             
page = page.split('method-list-section')[1].split('</ul>')[0].split('<ul class="link-list">')[1].split(' ').reject{ |v| v == '<li><a' }.map {|v| v.split('>')[1].split('<')[0] }.compact
# формируем строку для записи, хотя конечно можно и прям массивом записать
wrstr = page.inject(''){ | str, elm, |  str = str + elm.to_s + "\n" }
# Пишем в файл
File.write(filename, wrstr )
puts "Записан файл: #{filename}"