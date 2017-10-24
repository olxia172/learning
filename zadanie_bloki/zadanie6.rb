puts 'Podaj liczbę całkowitą a'
a = gets.to_i

puts 'Podaj liczbę całkowitą b'
b = gets.to_i

roznica = a - b
suma = a + b

if roznica == suma
  puts 'Suma jest równa różnicy'
elsif suma > roznica
  puts 'Suma jest większa od różnicy'
else
  puts 'Suma jest mniejsza od różnicy'
end
