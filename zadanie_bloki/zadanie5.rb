dystans = gets.to_f

zuzycie_paliwa = (dystans * 6.5) / 100
koszt = zuzycie_paliwa * 4.3

puts "Zużycie paliwa na podany dystans to: #{zuzycie_paliwa}, a koszt: #{koszt}"
