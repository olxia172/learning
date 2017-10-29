def common_elements(array1, array2)
  index = 0
  common_elements = []
  while index < array1.size
    if array2.include?(array1[index])
      common_elements << array1[index] unless common_elements.include?(array1[index])
    end
    index += 1
  end
  common_elements
end

print common_elements([1, 2, 3, 4, 5], [4, 5, 6])
print common_elements(['cat', 1227, 'apple', 0], ['apple', 'cat', 1227, 4])
print common_elements(['cat', 1227, 1227, 'apple', 0], [1227, 'apple', 'cat', 1227, 4])
