require  "pry"

value = [1, 3, 4, 7].inject(0) do |accum, elem|
  binding.pry
  accum + elem
end

puts value
