sum_d = 0 #suma liczb dodatnich
sum_u = 0 #suma liczb ujemnych

loop do
  x = gets.to_i
    if x < 0
      sum_u = sum_u + x
    elsif x > 0
      sum_d = sum_d + x
    end
  break if x == 0
end

puts "Suma liczb dodatnich wynosi: #{sum_d}"
puts "Suma liczb ujemnych wynosi: #{sum_u}"
