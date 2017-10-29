def multiples(n)
  numbers = (0..n).to_a
  index = 0
  sum = 0
  while index < numbers.size
    if (numbers[index] % 3).zero? || (numbers[index] % 5).zero?
      sum += numbers[index]
    end
    index += 1
  end
  sum
end

puts multiples(10)
puts multiples(20)
