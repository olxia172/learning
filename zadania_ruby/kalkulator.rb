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

loop do
  print 'What is your choice: '
  wybrana_operacja = gets.to_i

  break if wybrana_operacja == QUIT

  print 'Enter first number: '
  first_number = gets.to_i
  print 'Enter second number: '
  second_number = gets.to_i

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
