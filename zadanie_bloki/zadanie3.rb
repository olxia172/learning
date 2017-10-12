x = gets.to_i

if x == 2
  puts "Miesiąc ma 28 dni"
elsif x == 1 || 3 || 5 || 7 || 8 || 10 || 12 #należy do zbioru 1, 3, 5, 7, 8, 10, 12
  puts "Miesiąc ma 31 dni"
else
  puts "Miesiąc ma 30 dni"
end
