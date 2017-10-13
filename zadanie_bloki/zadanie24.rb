puts "Pierwsza liczba"
x = gets.to_i
puts "Druga liczba"
y = gets.to_i

loop do
  if x > y
    x = x - y
  else
    y = y - x
  end
  break if x == y
end

puts "Najwyższy wspólny dzielnik to: #{x}"
