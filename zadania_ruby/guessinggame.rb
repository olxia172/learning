num = rand(100)

loop do
  input = gets.to_i
    if input < num
      puts "więcej"
    else
      puts "mniej"
    end
  break if input == num
end

puts "Udało się: #{num}"
