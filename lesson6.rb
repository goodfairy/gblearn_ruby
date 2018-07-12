# 1. Создайте класс человека Person, унаследуйте от него классы посетителей User, администраторов Admin и модераторов Moderator.
# Запретите возможность создания объектов класса Person. Всем объектам классов добавьте возможность задавать фамилию, имя и отчество пользователя, а также получать эти сведения.

require_relative 'perscls.rb'
pers = Admin.new('Изя Петров Чингачкугович')
# pers = Person.new('Изя Петров Чингачкугович')  # а вот так сделать не даст
puts pers.mname
puts

# 2. Создайте класс любого объекта, например, холодильника. Представьте, что с холодильником могут взаимодействовать мастера, которые его чинят и люди, которые им пользуются.
# Если скучно возиться с холодильником — придумайте свой пример. В примере должен быть класс и минимум два инстанс-метода класса, один из которых демонстрирует использование private-метода.

require_relative 'fuflcls.rb'
millenniumfalcon = Dopobj.new
r2d2 = Droid.new('R2D2')
r2d2.setupdroid('astro',:droidlang)
r2d2.communicate(millenniumfalcon)
#r2d2.translatehuman('1000101000111110110') # а вот так сделать не даст

# 3. *Пусть имеется фабрика, которая выпускает детские игрушки: плюшевый медвежонок, мяч, кубики.
# Создайте класс Factory, который имеет метод Factory.build, возвращающий объект классов BearCub, Ball или Cube, соответствующих одной из игрушек.
# В качестве параметра, метод должен принимать один из спимволов :bear_cub, :ball, :cube, по которым будет приниматься решение о том, объект какого класса следует вернуть.

require_relative 'factory.rb'
megafactory = Factory.new
puts megafactory.build(:cube).class
puts megafactory.build(:bear).class
puts megafactory.build(:ball).class
puts
#puts megafactory.build(:toy).class # а вот так сделать не даст

# 4. *Создайте класс судна. Унаследуйте от него два типа судов: с возможностью плавать под водой и над водой. С использованием полученных классов создайте:
# атомную подводную лодку (ракеты, торпеды);
# * сухогруз для перевоза зерна (грузовой трюм, кран);
# * контейнеровоз (кран);
# * нефтяной танкер (грузовой трюм);
# * ракетный крейсер (ракеты);
# * военный транспорт (ракеты, грузовой трюм, кран).

require_relative 'vessel.rb'
supercargo = Abovewater.new('контейнеровоз', ['cargo'], 10)
supercargo.hold, supercargo.crane = false, true
puts supercargo.inspect

zernocargo = Abovewater.new('сухогруз ', ['cargo'], 40)
zernocargo.hold, zernocargo.crane = true, true
puts zernocargo.inspect

tankercargo = Abovewater.new('нефтяной танкер', ['cargo'], 50)
tankercargo.hold, tankercargo.crane = true, false
puts tankercargo.inspect

atomander = Underwater.new('подводная лодка', ['military'], 10000)
atomander.rocket, atomander.torpedo = true, false
puts atomander.inspect

rocketbot = Abovewater.new('ракетный крейсер', ['military'], 45)
rocketbot.rocket, rocketbot.torpedo = true, false
puts rocketbot.inspect

militarycargo = Abovewater.new('военный транспорт', ['cargo','military'], 150)
militarycargo.hold, militarycargo.crane = true, true
militarycargo.rocket, militarycargo.torpedo = true, false
puts militarycargo.inspect

# 5. *Реализуйте модуль Fivable, включение которого в класс будет разрешать создание только пяти объектов этого класса.
# модуль подключен к классам с судами (vessel.rb), для проверки работы в классе Fivable надо задать MAX_INSTANCES значение 5,
# ну или какое вам больше нравится. Подключить к любому классу - require_relative 'limit.rb' и prepend Fivable в классе
