class User
  attr_reader :user_id333
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
    user_rate = (user_rate == 'ask') ? askrate : user_rate
    usr_name = usr_name.to_s.split
    @usr_fio = { name: usr_name[0], sname: usr_name[1], mname: usr_name[2] }
    rate(user_rate) unless user_rate.nil?
    occupation(usr_occupation) unless usr_occupation.nil?
    @user_id = User.inccnt
  end

  def askrate
    nodata = true
    while nodata
      puts 'Введите оценку от 0 до 5 (0- установить рандомно, N - позорно сбежать)'
      user_rate = STDIN.gets.delete(" \t\r\n")
      case
      when (user_rate == '')
        puts 'Нужно ченидь ввести, иначе никуда дальше не пойдем :('
      when user_rate.casecmp('N').zero?
        abort 'Хозин барин, програм терминейтед бай юзер войс'
      when !(user_rate.to_i.to_s == user_rate.to_s || user_rate.to_f.to_s == user_rate.to_s)
        puts 'Нужно ввести правильное значение, иначе никуда дальше не пойдем :('
      when (user_rate.to_i.to_s == user_rate.to_s || user_rate.to_f.to_s == user_rate.to_s) && (0..5).cover?(user_rate.to_f.ceil)
        nodata = false
        puts 'ok. оценка принята'
      else
        puts 'Нужно ввести правильное значение, иначе никуда дальше не пойдем :('
      end
    end
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
  def initialize(group_name)
    @group_name = group_name
    @group_users = []
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
