def highest_number(numbers)
  num_array = []
  numbers.to_s.each_char { |chr| num_array << chr.to_i }
  sorted = num_array.sort { |x, y| y <=> x}
  sorted.join.to_i
end

print highest_number(123456)
puts " "
print highest_number(1464)
puts " "
print highest_number(165023)
puts " "
