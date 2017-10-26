print " "*5
liczba = 0
while liczba < 10
  liczba += 1
  print "%-5d" % liczba
end

puts ' '
print '     ' + '---- '*10

mnoznik = 0
while mnoznik < 10
  mnoznik +=1
  print "\n" + "%-3d" % mnoznik + "| "
  liczba = 0
    while liczba < 10
      liczba += 1
      wynik = mnoznik * liczba
      print "%-5d" % wynik
    end
end

puts ' '
