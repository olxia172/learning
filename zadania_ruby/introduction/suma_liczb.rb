number = gets.to_i

i = 0
suma_liczb_parzystych = 0

while i < number
  i += 1
  if i % 2 == 0
    suma_liczb_parzystych += i
  end
end

puts suma_liczb_parzystych
