puts "Podaj liczbę całkowitą a"
a = gets.to_i

puts "Podaj liczbę całkowitą b"
b = gets.to_i

r = a - b #różnica
s = a + b #suma

if r == s
  puts "Suma jest równa różnicy"
elsif s > r
  puts "Suma jest większa od różnicy"
else
  puts "Suma jest mniejsza od różnicy"
end
