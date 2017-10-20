def find_index(array, value)
  array.each_with_index do |elem, index|
    if elem == value
      return index
    end
  end
  return 'not found'
end

puts find_index([1, 2, 3, 4, 5], 3)
puts find_index([5, 8, 6, 2, 2, 10], 2)
puts find_index([10, 20, 30], 100)
puts find_index([], 0)
