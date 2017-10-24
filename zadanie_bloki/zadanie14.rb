puts 'Podaj liczbę:'
n = gets.to_i

if n < 2
  puts 'Liczba musi być > 1'
else
  i = 2
  while i <= n
    puts i
    i += 2
  end
end
