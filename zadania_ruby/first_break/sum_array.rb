def sum_array(array)
  new_array = array.reject { |elem| elem == array.max || elem == array.min }
  index = 0
  sum = 0
  while index < new_array.size
    sum += new_array[index]
    index += 1
  end
  sum
end

puts sum_array([1, 2, 3, 4])
puts sum_array([12, 4, 0, -8])
puts sum_array([12, 4])
puts sum_array([120, 7, 145, -10, -15])
