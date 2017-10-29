def equal_sizes_arrays?(array)
  sizes_array = array.map { |elem| elem.size }
  sizes_array.uniq!
  return sizes_array.size == 1
end

def avg_array(*main_array)
  raise 'Sizes of arrays are not the same' unless equal_sizes_arrays?(main_array)
  index = 0
  result_array = []
  while index < main_array[0].size
    main_index = 0
    sum = 0
    while main_index < main_array.size
      elem = main_array[main_index][index]
      sum += elem
      main_index += 1
    end

    result = sum / main_array.size.to_f
    result_array << result
    index += 1
  end
  result_array
end

print avg_array([1, 3, 5], [3, 5, 7])
print avg_array([1, 5, 3, 22], [12, 22, 13, 5], [5, 12, 24, 5], [14, 40, 5, 17])
