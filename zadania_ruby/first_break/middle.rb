def middle(word)
  if (word.length % 2).zero?
    position1 = word.length / 2
    position2 = (word.length / 2) + 1
    return word[position1, position2]
  else
    position = word.length / 2
    return word[position]
  end
end

puts middle('word')
puts middle('bla')
puts middle('tesTing')
