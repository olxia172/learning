puts 'Podaj liczbę:'
n = gets.to_i

puts "\n"

if n < 1
  puts 'Liczba musi być > 0'
else
  i = 0

  while i < n
    j = -n + i
    i += 1
    puts i
    puts j
  end
end
