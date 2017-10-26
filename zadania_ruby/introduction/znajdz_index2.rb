value = gets.to_i

array = [1, 2, 3, 4, 5, 5, 4]

def find_index(array, value)
  if array.include?(value)
    puts array.index(value)
  else
    puts 'not found'
  end
end

find_index(array, value)
