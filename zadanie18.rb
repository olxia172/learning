sum = 0

loop do
  x = gets.to_i
    if x % 2 == 0
      sum = sum + x
    end
  break if x == 0
end

puts sum
