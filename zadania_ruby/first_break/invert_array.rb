def invert_array(array)
  inverted = []
  array.each { |elem| inverted << (-elem)}
  inverted
end

print invert_array([1, 2, 3, 4, 5])
puts " "
print invert_array([1, -2, 3, -4, 5])
puts " "
print invert_array([0])
