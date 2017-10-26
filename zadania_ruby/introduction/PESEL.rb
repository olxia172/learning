def ask_for_input(prosba)
  print prosba
  return gets.to_i
end

def pesel_valid?(pesel)
  p = pesel.digits.reverse
  sum = (p[0].to_i + p[4].to_i + p[8].to_i) * 9 + (p[1].to_i + p[5].to_i + p[9].to_i) * 7 + (p[2].to_i + p[6].to_i) * 3 + p[3].to_i + p[7].to_i
  return sum % 10 == p.last
end

def what_sex(pesel)
  p = pesel.digits.reverse
  if (p[9].to_i % 2).zero?
    sex = 'kobieta'
  else
    sex = 'meżczyzna'
  end
  puts " - płeć: #{sex}"
end

def what_birth_date(pesel)
  p = pesel.digits.reverse
  if p[2].to_i < 2
    month = "#{p[2]}#{p[3]}"
  else
    month = "#{(p[2].to_i * 10 - 10)}#{p[3]}"
  end
  if p[2].to_i < 2
    year = 1900 + p[0].to_i * 10 + p[1].to_i
  else
    year = 2000 + (p[0].to_i * 10 - 10) + p[1].to_i
  end
  puts " - data urodzenia: #{p[4]}#{p[5]}-#{month}-#{year}"
end

pesel = ask_for_input('Wpisz numer PESEL: ')

if pesel_valid?(pesel)
  puts "PESEL o numerze #{pesel} jest prawidłowy."
  puts 'Informacje o numerze PESEL:'
  what_sex(pesel)
  what_birth_date(pesel)
else
  puts "PESEL o numerze #{pesel} jest nieprawidłowy."
end
