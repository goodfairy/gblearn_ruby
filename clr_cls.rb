class Color
  ##
  # initialize Сolor class by user data, or default data
  #
  # default data - красный оранжевый желтый зеленый голубой синий фиолетовый
  # data option - array of colors name
  #
  def initialize(init_colors = %w[красный оранжевый желтый зеленый голубой синий фиолетовый])
    @color_accordance = (1..init_colors.size).to_a.zip(init_colors).to_h
  end

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
