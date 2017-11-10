def middle(word)
  position = word.length / 2

  if (word.length % 2).zero?
    return word[position, position + 1]
  else
    return word[position]
  end
end

puts middle('word')
puts middle('bla')
puts middle('tesTing')
