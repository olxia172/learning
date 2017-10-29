def highest_number(numbers)
  num_array = []
  numbers.to_s.each_char { |chr| num_array << chr.to_i }

  sorted = []
  loop do
    max_num = num_array.max
    sorted << max_num
    max_num_index = num_array.find_index(max_num)
    num_array.delete_at(max_num_index)
  break if num_array.empty?
  end
  sorted.join.to_i
end

print highest_number(123456)
puts " "
print highest_number(1464)
puts " "
