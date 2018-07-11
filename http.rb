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
