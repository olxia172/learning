def backspaces(text)
  elements = []
  text.each_char { |chr| elements << chr }

  while elements.include?('#')
    index = elements.find_index('#')
    elements.delete_at(index)
    elements.delete_at(index - 1) if index - 1 >= 0
  end
  elements.join
end

puts backspaces('a#bc#d')
puts backspaces('abc#d##c')
puts backspaces('abc##d######c')
puts backspaces('')
puts backspaces('a##bcd')
