def accum(text)
  index = 0
  accum = []
  while index < text.size
    element = text[index] * (index + 1)
    element.capitalize!
    accum << element
    index += 1
  end
  accum.join('-')
end

puts accum('ola')
puts accum('abCd')
