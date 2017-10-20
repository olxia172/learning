def each_element(array)
  index = 0
  while index < array.size
    element = array[index]
    yield element
    index += 1
  end
end

each_element(['Arek', 'Ola', 'Himen']) { |opp| puts opp}
