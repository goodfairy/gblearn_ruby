class User
  ##
  # initialize Customer by user data, or default data
  #
  # default data - 'Иван Иванов Иванович разнорабочий'
  # data option - user name, user surname, user midle name, user occupation
  #
  def initialize(usr_name = 'Иван', usr_sname = 'Иванов', usr_mname = 'Иванович', usr_occupation = 'разнорабочий')
    @usr_name, @usr_sname, @usr_mname, @usr_occupation = usr_name, usr_sname, usr_mname, usr_occupation
    @color_accordance = { 1 => 'красный', 2 => 'оранжевый', 3 => 'желтый', 4 => 'зеленый', 5 => 'голубой', 6 => 'синий', 7 => 'фиолетовый' }
  end

  ##
  # return user occupation ( example > разнорабочий )
  #
  def profession
    @usr_occupation
  end

  ##
  # Return user's name surname middle name  ( example > Иванов Иван Иванович )
  #
  def fio
    @usr_sname.to_s + ' ' + @usr_name.to_s + ' ' + @usr_mname.to_s
  end

  ##
  # Return color name with specified color number, if number is out date, return nil
  #
  def colors(color_num)
    @color_accordance[color_num.to_i]
  end

  ##
  # Return color number with specified color name, if name dos not exist, return nil
  #
  def colors_num(color_name)
    @color_accordance.invert[color_name]
  end

  ##
  # Return random color number
  #
  def getrandomcolor
    Random.new.rand(1..@color_accordance.size)
  end

  ##
  # Ask color number and return color name
  #
  def asknum_getcolor
    puts "Введите номер цвета от 1 до #{@color_accordance.size}"
    user_color = colors(STDIN.gets.chomp.to_i)
    user_color.nil? ? 'Цвета с таким номером не существует' : "Цвет: #{user_color}" 
  end

  ##
  # Show all colors name
  #
  def list_colors
    puts @color_accordance.values.sort
  end

  ##
  # Ask color name and return color number
  #
  def askcolor_getnum
    puts 'Введите название цвета'
    user_color = colors_num(STDIN.gets.chomp.to_s.encode!(Encoding::UTF_8).downcase)
    user_color.nil? ? 'У данного цвета нет номера' : "Номер цвета: #{user_color}"
  end
end
