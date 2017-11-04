def consecutives_sum(numbers)
  result = []
  until numbers.empty?
    index = 0
    storage = []
    if numbers[index] == numbers[index + 1]
      while numbers[index] == numbers[index + 1]
        storage << numbers.shift
      end
      storage << numbers.shift
      accum = storage.inject(0) { |accum, elem| accum + elem }
      result << accum
    else
      result << numbers.shift
    end
  end
  result
end

print consecutives_sum([1, 4, 4, 4, 0, 4, 3, 3, 1])
print consecutives_sum([1, 1, 7, 7, 3])
print consecutives_sum([-5, -5, 7, 7, 12, 0])
