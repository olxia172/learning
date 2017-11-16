class Calculator
  attr_reader :name, :history
  attr_accessor :memory, :result

  def initialize(name)
    @name = name
    @history = []
    self.result = nil
    self.memory = 0
  end

  def set_memory
    self.memory = @result
  end

  def clear
    self.result = 0
    self.memory = 0
    add_to_history('clear')
  end

  def add(number)
    self.result = memory + number
    set_memory
    add_to_history('add', number)
  end

  def subtract(number)
    self.result = memory - number
    set_memory
    add_to_history('subtract', number)
  end

  def multiply(number)
    self.result = memory * number
    set_memory
    add_to_history('multiply', number)
  end

  def divide(number)
    self.result = memory / number
    set_memory
    add_to_history('divide', number)
  end

  def change_sign
    self.result = -result
    add_to_history('change_sign')
  end

  def add_to_history(method, number = nil)
    action = {
      method: method,
      number: number,
      result: result
    }
    @history << action
  end

  def print_history
    puts 'History:'
    @history.each do |action|
      print "#{action[:method]} #{action[:number]} (result: #{action[:result]})\n"
    end
  end
end

calculator = Calculator.new("CASIO")

puts calculator.name # prints CASIO

calculator.add(2)
calculator.add(3)

puts calculator.result # prints 5

calculator.add(10)
puts calculator.result # prints 15

calculator.clear # set result to 0
puts calculator.result # prints 0

calculator.subtract(20)
puts calculator.result # prints -20

calculator.multiply(3)
puts calculator.result # prints -60
calculator.divide(4)
puts calculator.result # prints -15
calculator.change_sign
puts calculator.result # prints 15

calculator.print_history # prints entire history
