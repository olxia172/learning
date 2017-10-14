puts "Pierwsza liczba"
x = gets.to_i
puts "Druga liczba"
y = gets.to_i

while x != y
  if x > y
    x -= y
  else
    y -= x
  end
end

puts "Najwyższy wspólny dzielnik to: #{x}"
