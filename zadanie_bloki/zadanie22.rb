u = false #czy wystąpiła liczba ujemna
d = false #czy wystąpiła liczba dodatnia

loop do
  x = gets.to_i
    if x < 0
      u = true
    elsif x > 0
      d = true
    end
  break if x == 0
end

if u == true
  puts 'Wystąpiła liczba ujemna'
end

if d == true
  puts 'Wystąpiła liczba dodatnia'
end
