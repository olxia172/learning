def initials(name_surname)
  words = name_surname.split(/(\s|-)/) # regexp rubular.com
  words.reject! { |word| word == " " || word == "-"}
  letters = words.map { |word| word[0] }
  letters.join.upcase
end


puts initials('Jan Kowalski')
puts initials('marcin pawel piotrowski')
puts initials('Aleksandra Katarzyna Kucharczyk-Buras')
