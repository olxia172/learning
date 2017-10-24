def foldr(start_accumulator, array)
  index = 0
  array = array.reverse
  accumulator = start_accumulator
  while index < array.size
    element = array[index]
    accumulator = yield(accumulator, element)
    index += 1
  end
  puts accumulator
end

foldr(0, [3, 4, 65, 9]) { |accumulator, element| element - accumulator }
