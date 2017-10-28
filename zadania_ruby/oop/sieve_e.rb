user_input = ARGV

start = user_input.first.to_i
finish = user_input.last.to_i

if finish < start
  puts 'ERROR! Enter a smaller number first and then a larger one.'
end

naturals = (2..finish).to_a

index = 0
while index < naturals.length
  prime = naturals[index]
  naturals.reject! { |num| num % prime == 0 && num > prime }
  index += 1
end

naturals.reject! { |num| num < start }
n = naturals.join(", ")
print "Prime numbers: #{n}\n"
