user_input = ARGV

x = user_input[0].to_i
y = user_input[1].to_i

while x != y
  if x > y
    x -= y
  else
    y -= x
  end
end

puts "Najwyższy wspólny dzielnik to: #{x}"
