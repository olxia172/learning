require "pry"

def hamming_distance(string1, string2)
  return unless string1.size == string2.size
  distance = 0
  index = 0
  while index < string1.size
    distance += 1 unless string1[index] == string2[index]
    index += 1
  end
  distance
end

binding.pry
puts hamming_distance('1234', '1235').inspect
puts hamming_distance('GAGCCT', 'CATCGT').inspect
puts hamming_distance('1234', '12345').inspect
puts hamming_distance('123', 'foobar').inspect
