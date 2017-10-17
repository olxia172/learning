#value = gets.to_i

#array = [7, 2, 4, 2, 1, 5, 6]
#print array
#puts ' '

def find_index(array, value)
  if array.include?(value)

    index = 0
    while array[index] != value
      index += 1
    end
    puts index

  else
    puts 'not found'
  end
end

find_index([1, 5, 9, 4, 6], 5)
