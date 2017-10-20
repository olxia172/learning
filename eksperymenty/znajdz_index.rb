#value = gets.to_i

#array = [7, 2, 4, 2, 1, 5, 6]
#print array
#puts ' '

def find_index(array, value)
  #if array.include?(value)

    index = 0
    while index < array.size
      if array[index] == value
        return index
      end
      index += 1
    end
    return 'not found'

  #else
  #  puts 'not found'
  #end
end

puts find_index([1, 2, 3, 4, 5], 3)
puts find_index([5, 8, 6, 2, 2, 10], 2)
puts find_index([10, 20, 30], 100)
puts find_index([], 0)
