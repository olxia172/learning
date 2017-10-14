miesiac = gets.to_i

miesiace_po_31_dni = [1, 3, 5, 7, 8, 10, 12]

if miesiac == 2
  puts "Miesiąc ma 28 dni"
elsif miesiace_po_31_dni.include?(miesiac)  #należy do zbioru 1, 3, 5, 7, 8, 10, 12
  puts "Miesiąc ma 31 dni"
else
  puts "Miesiąc ma 30 dni"
end
