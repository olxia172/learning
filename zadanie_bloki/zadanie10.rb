puts 'Podaj trzy liczby:'
a = gets.to_i
b = gets.to_i
c = gets.to_i

if a < b && b < c
  puts 'Ciąg jest rosnący'
else
  puts 'Ciąg nie jest rosnący'
end
