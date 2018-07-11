# Пусть имеется хэш { red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый' }.
# Првератите его в хэш { 'красный' => 'red', 'оранжевый' => 'orange', 'желтый' => 'yellow', 'зеленый' => 'green', 'голубой' => 'blue', 'синий' => 'indigo', 'фиолетовый' => 'violet' }.

ithash = { red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый' }
puts ithash.values.zip(ithash.keys.map(&:to_s)).to_h

# 2. Преобразуйте массив вида %w[first second third] в хэш вида {first: 'Fst (1)', second: 'Snd (2)', third: 'Trd (3)'}.
# Выражение преобразования должно быть однострочным.
inarray = %w[first second third]
puts inarray.zip(inarray.map{ | item , count | item[0..0].capitalize.to_s+item[-2..-1].to_s+"(#{inarray.index(item)+1})" }).to_h

# 2. Имеется два массива %w[red orange yellow green gray indigo violet] и %w[красный оранжевый желтый зеленый голубой синий фиолетовый].
# Создайте из них хэш {red: 'красный', orange: 'оранжевый', yellow: 'желтый', green: 'зеленый', blue: 'голубой', indigo: 'синий', violet: 'фиолетовый'}
firstarr = %w[red orange yellow green gray indigo violet]
secondarr = %w[красный оранжевый желтый зеленый голубой синий фиолетовый]
puts firstarr.zip(secondarr).to_h