puts 'Podaj trzy liczby:'
a = gets.to_i
b = gets.to_i
c = gets.to_i

max = a

if max < b
  max = b
end

if max < c
  max = c
end

puts ' '
puts max
