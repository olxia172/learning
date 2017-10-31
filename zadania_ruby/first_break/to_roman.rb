def to_roman(number)
  if (number / 1000) > 0
    m = 0
    until number < 1000
      m += 1
      number -= 1000
    end
    tysiace = 'M' * m
  end

  if (number / 100) > 0
    c = 0
    until number < 100
      c += 1
      number -= 100
    end

    if c < 4
      setki = 'C' * c
    elsif c == 4
      setki = 'CD'
    elsif c > 4 && c < 9
      setki = 'D' + 'C' * (c - 5)
    elsif c == 9
      setki = 'XM'
    end
  end

  if (number / 10) > 0
    x = 0
    until number < 10
      x += 1
      number -= 10
    end

    if x < 4
      dziesiatki = 'X' * x
    elsif x == 4
      dziesiatki = 'XL'
    elsif x > 4 && x < 9
      dziesiatki = 'L' + 'X' * (x - 5)
    elsif x == 9
      dziesiatki = 'XC'
    end
  end

  if (number / 1) > 0
    i = 0
    until number.zero?
      i += 1
      number -= 1
    end

    if i < 4
      jednosci = 'I' * i
    elsif i == 4
      jednosci = 'IV'
    elsif i > 4 && i < 9
      jednosci = 'V' + 'I' * (i - 5)
    elsif i == 9
      jednosci = 'IX'
    end
  end
  print tysiace
  print setki
  print dziesiatki
  print jednosci
end

puts to_roman(3)
puts to_roman(23)
puts to_roman(623)
puts to_roman(2623)
puts to_roman(3000)
puts to_roman(200)
puts to_roman(10)
