puts "Podaj liczbę:"
n = gets.to_i

if n < 1
  puts "Liczba musi być > 0"
else
  i = 1
  while i <= n
    puts i
    puts -i
    i = i + 1
  end
end
