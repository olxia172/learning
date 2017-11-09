class Figures
  def result
    area
    perimeter
    puts ''
  end

  def area(area, unit)
    puts "Pole wynosi: #{area}#{unit}2"
  end

  def perimeter(perimeter, unit)
    puts "Obwód wynosi: #{perimeter}#{unit}"
  end

  private

  def string_to_array(input)
    value_in_array = []
    units = ['m', 'c', 'k']
    input.each_char { |char| value_in_array << char unless units.include?(char) }
    value_in_array
  end

  def take_value(input)
    string_to_array(input).join.to_f
  end

  def value_precision(input)
    value_in_array = string_to_array(input)
    if value_in_array.include?('.')
      i = 0
      until value_in_array[i] == '.'
        value_in_array.delete_at(i)
      end
      counter = 0
      value_in_array.each { |elem| counter += 1 unless elem == '.' }
      return counter
    else
      return 0
    end
  end

  def take_unit(input)
    final_unit = []
    units = ['m', 'c', 'k']
    input.each_char do |char|
      final_unit << char if units.include?(char)
    end
    final_unit.join
  end
end

class Circle < Figures
  def initialize(radius)
    @radius = take_value(radius)
    @unit = take_unit(radius)
    @precision = value_precision(radius)
  end

  def area
    area = (3.14 * (@radius**2)).round(@precision)
    super(area, @unit)
  end

  def perimeter
    perimeter = (2 * 3.14 * @radius).round(@precision)
    super(perimeter, @unit)
  end
end

class Trapeze < Figures
  def initialize(a, b, h)
    @a = take_value(a)
    @b = take_value(b)
    @h = take_value(h)
    @unit = take_unit(a)
    @precision = value_precision(a)
  end

  def area
    area = (@h * ((@a + @b) / 2.0)).round(@precision)
    super(area, @unit)
  end

  def perimeter
    perimeter = (@a + @b + 2 * c).round(@precision)
    super(perimeter, @unit)
  end

  private

  def c
    d = (@b - @a) / 2.0
    Math.sqrt(@h * @h + d * d)
  end
end

class Rectangle < Trapeze
  def initialize(a, b)
    super(b, b, a)
  end
end

class Square < Rectangle
  def initialize(a)
    super(a, a)
  end
end

puts 'Circles:'
Circle.new('5cm').result
Circle.new('2.25cm').result
Circle.new('100m').result
Circle.new('2.25cm').result
puts 'Rectangles:'
Rectangle.new('5cm', '2cm').result
Rectangle.new('3.33cm', '4.20cm').result
Rectangle.new('124m', '33m').result
Rectangle.new('1.2km', '2.2km').result
puts 'Squares:'
Square.new('3cm').result
Square.new('4.45').result
Square.new('12m').result
Square.new('3.66km').result
puts 'Trapezes:'
Trapeze.new('2.34cm', '6.66cm', '2cm').result
Trapeze.new('113m', '33m', '16m').result
