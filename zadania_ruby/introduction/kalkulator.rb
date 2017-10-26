# operacje
ADDITION = 1
SUBTRACTION = 2
MULTIPLICATION = 3
DIVISION = 4
QUIT = 5

puts 'Choose operation:'
puts ' 1. Add numbers'
puts ' 2. Subtract numbers'
puts ' 3. Multiply numbers'
puts ' 4. Divide numbers'
puts ' 5. Quit'

def popros_o_int(prosba)
  print prosba
  return gets.to_i
end

loop do
  wybrana_operacja = popros_o_int('What is your choice? ')

  break if wybrana_operacja == QUIT

  first_number = popros_o_int('Enter first number: ')
  second_number = popros_o_int('Enter second number: ')

  case wybrana_operacja
  when ADDITION
    outcome = first_number + second_number
    znak = '+'
  when SUBTRACTION
    outcome = first_number - second_number
    znak = '-'
  when MULTIPLICATION
    outcome = first_number * second_number
    znak = '*'
  when DIVISION
    if second_number.zero?
      puts 'Do not divide by 0!'
      next
    else
      outcome = first_number / second_number
      znak = '/'
    end
  end
  puts "#{first_number} #{znak} #{second_number} = #{outcome}"
end

puts 'Bye, bye'
