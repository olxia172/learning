sum = 0

x = gets.to_i

until x == 0
  reszta = x % 10
  sum += reszta
  x = (x - reszta) / 10
end

puts sum
