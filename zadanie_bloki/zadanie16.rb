puts 'Podaj liczbę:'
n = gets.to_i

if n < 1
  puts 'Liczba musi być > 0'
else
  i = 1
  j = -n
  while i <= n
    puts i
    puts j
    i += 1
    j = -n + (i - 1)
  end
end
