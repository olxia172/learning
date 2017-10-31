def palindrome?(sentence)
  letters = []
  sentence.downcase.each_char { |chr| letters << chr }
  letters.reject! { |elem| elem == ' ' }

  if letters == letters.reverse
    true
  else
    false
  end
end

puts palindrome?('Kobyła ma mały bok')
puts palindrome?('A to kanapa pana Kota')
puts palindrome?('kajak')
puts palindrome?('kajak i wiosło')
