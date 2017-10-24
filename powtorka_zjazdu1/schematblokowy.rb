a = gets.to_i
b = gets.to_i

counter = 0
result = 1

while counter < b
  counter += 1
  result *= a
end

puts result
