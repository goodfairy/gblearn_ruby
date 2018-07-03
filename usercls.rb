class User
  attr_reader :user_id
  @@user_count =0 
  ##
  # initialize Customer by user data, or default data
  #
  # default data - 'Иван Иванов Иванович разнорабочий'
  # data option - user name, user surname, user midle name, user occupation
  #
  def initialize(usr_name = 'ask', user_rate = nil, usr_occupation = nil)
    if usr_name =='ask' then
      puts 'Введите Имя Фамилию Отчество пользователя через пробел'
      usr_name = STDIN.gets.chomp.to_s.encode!(Encoding::UTF_8)
    end
    if user_rate =='ask' then
      puts 'Введите оценку (0 - установить рандомно)'
      user_rate = STDIN.gets.chomp.to_i
    end
    usr_name = usr_name.to_s.split
    @usr_fio = { :name => usr_name[0] , :sname =>  usr_name[1], :mname =>  usr_name[2]}
    set_rate(user_rate) if !user_rate.nil?
    set_occupation(usr_occupation) if !usr_occupation.nil?
    @@user_count += 1
    @user_id = @@user_count
  end
  
  def set_occupation(usr_occupation)
    @usr_occupation = usr_occupation
  end
  ##
  # return user occupation ( example > разнорабочий )
  #
  def get_occupation
    @usr_occupation
  end


  ##
  # Return user's name surname middle name  ( example > Иванов Иван Иванович )
  #
  def get_fio
    @usr_fio.values.join(' ')
  end
  
  def set_rate(user_rate)
    if (0..5).include?(user_rate) then
      @user_rate = user_rate.zero? ? rand(1..5) : user_rate
    end
  end
  
  def get_rate
    @user_rate
  end
  
  def get_info(inf = '1100') #id, fio, rate, ocp
    info = Array.new(0)
    info.push("ID-#{@user_id}") if !inf[0].to_i.zero?
    info.push("ФИО-#{@usr_fio.values.join(' ')}") if !inf[1].to_i.zero?
    info.push("Rate-#{get_rate}") if !inf[2].to_i.zero?
    info.push("Occupation-#{get_occupation}") if !inf[3].to_i.zero?
    info.compact.join('  ').to_s
  end
end

class Usergroup 

  def initialize(group_name)
    @group_name = group_name
    @group_users = Array.new(0)
  end
  
  def add_user(newuser)
    @group_users.push(newuser)
  end
  
  #def delete_user(deluser_id)
  #  @del_item[0] = @group_users.find { | item | item.user_id == deluser_id }
  #  @group_users - @del_item
  #  @group_users.compact    
  #end

  def getbest_user
    @group_users.max { | item_a, item_b | item_a.get_rate <=>  item_b.get_rate }
  end

  def getworst_user
    @group_users.min { | item_a, item_b | item_a.get_rate <=>  item_b.get_rate }
  end
  
  def list_user(param = '1110')
    @group_users.each { | item | puts item.get_info }
  end
end
