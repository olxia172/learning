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

  if wybrana_operacja == ADDITION
    print 'Enter first number: '
    first_number = gets.to_i
    print 'Enter second number: '
    second_number = gets.to_i

    outcome = first_number + second_number
    puts "#{first_number} + #{second_number} = #{outcome}"
  end

  if wybrana_operacja == SUBTRACTION
    print 'Enter first number: '
    first_number = gets.to_i
    print 'Enter second number: '
    second_number = gets.to_i

    outcome = first_number - second_number
    puts "#{first_number} - #{second_number} = #{outcome}"
  end

  if wybrana_operacja == MULTIPLICATION
    print 'Enter first number: '
    first_number = gets.to_i
    print 'Enter second number: '
    second_number = gets.to_i

    outcome = first_number * second_number
    puts "#{first_number} * #{second_number} = #{outcome}"
  end

  if wybrana_operacja == DIVISION
    print 'Enter first number: '
    first_number = gets.to_i
    print 'Enter second number: '
    second_number = gets.to_i

    if second_number.zero?
      puts 'Do not divide by 0!'
    else
      outcome = first_number / second_number
      puts "#{first_number} / #{second_number} = #{outcome}"
    end

  end

  break if wybrana_operacja == QUIT
end

puts 'Bye, bye'
