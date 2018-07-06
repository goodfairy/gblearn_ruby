class User
  attr_reader :user_id
  @user_count = 0
  def self.inccnt
    @user_count += 1
  end

  ##
  # initialize Customer by user data, or default data
  #
  # default data - 'Иван Иванов Иванович разнорабочий'
  # data option - user name, user surname, user midle name, user occupation
  #
  def initialize(usr_name = 'ask', user_rate = nil, usr_occupation = nil)
    if usr_name == 'ask'
      puts 'Введите Имя Фамилию Отчество пользователя через пробел'
      usr_name = STDIN.gets.chomp.to_s.encode!(Encoding::UTF_8)
    end
    user_rate = askrate if user_rate == 'ask'
    usr_name = usr_name.to_s.split
    @usr_fio = { name: usr_name[0], sname: usr_name[1], mname: usr_name[2] }
    rate(user_rate) unless user_rate.nil?
    occupation(usr_occupation) unless usr_occupation.nil?
    @user_id = User.inccnt
  end

  def askrate
    nodata = true
    while nodata
      puts 'Введите оценку от 1 до 5 (N - позорно сбежать)'
      user_rate = STDIN.gets.delete(" \t\r\n")
      abort 'Хозин барин, програм терминейтед бай юзер войс' if user_rate.casecmp('N').zero?
      nodata = false if (1..5).cover?(user_rate.to_f.ceil)
    end
    puts "ok. оценка #{user_rate} принята"
    user_rate
  end

  ##
  # set and return user occupation: example > set_occupation('разнорабочий')
  #
  def occupation(usr_occupation = nil)
    @usr_occupation = usr_occupation.nil? ? @usr_occupation : usr_occupation
  end

  ##
  # return users name surname middle name  ( example > Иванов Иван Иванович )
  #
  def fio
    @usr_fio.values.join(' ')
  end
  alias full_name fio
  alias to_s fio

  ##
  # return users name surname middle name as array or hash, default as array  ( example > Иванов Иван Иванович )
  #
  def fioarray(type = nil)
    type.nil? ? @usr_fio.values : @usr_fio
  end

  ##
  # set and return user name or sname or mname  ( example for set> name('sname', 'Petrov' ) example for get> name('mname') )
  #
  def name(type, newval = nil)
    @usr_fio[type.to_sym] = newval.nil? ? @usr_fio[type.to_sym] : newval
  end

  ##
  # set and return user rate: example > set_rate(4)
  # if value user_rate is zero, user_rate sets random between from 1 to 5
  #
  def rate(user_rate = nil)
    @user_rate = user_rate.nil? ? @user_rate : (user_rate.to_i.zero? ? rand(1..5) : user_rate if (0..5).cover?(user_rate.to_i))
  end

  ##
  # return users info (id, fio, rate, ocp) : example get_info(1010) > ID - 3 Rate-4 )
  #
  def info(inf = '1110')
    infarray = []
    infarray.push("ID-#{@user_id}") unless inf[0].to_i.zero?
    infarray.push("ФИО-#{@usr_fio.values.join(' ')}") unless inf[1].to_i.zero?
    infarray.push("Rate-#{rate}") unless inf[2].to_i.zero?
    infarray.push("Occupation-#{occupation}") unless inf[3].to_i.zero?
    infarray.compact.join('  ').to_s
  end
end

class Usergroup
  ##
  # initialize Usergroup by user data
  # data option - group name
  #
  def initialize(group_name, user_array = nil)
    @group_name = group_name
    @group_users = user_array.nil? ? [] : user_array
  end

  ##
  # add user in Usergroup
  #
  def add_user(newuser)
    @group_users.push(newuser)
  end

  ##
  # delete user from Usergroup with user_id
  #
  def delete_user(deluser_id)
    @group_users.delete_if { |item| item.user_id == deluser_id }
  end

  ##
  # retur user with max rate
  #
  def best_user
    @group_users.max_by(&:rate)
  end

  ##
  # retur user with min rate
  #
  def worst_user
    @group_users.min_by(&:get_rate)
  end

  ##
  # retur list of all users
  #
  def list_user(param = '1110')
    @group_users.each { |item| puts item.info(param) }
  end

  ##
  # retur user with user_id
  #
  def user_by_id(user_id)
    @group_users.find { |item| item.user_id == user_id }
  end
end

Group = Usergroup
