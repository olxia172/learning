puts 'Podaj liczbę:'
n = gets.to_i

if n < 1
  puts 'Liczba musi być > 0'
else
  i = 1
  sum = i**2
  while i < n
    i += 1
    sum += i**2
  end
end

puts sum
