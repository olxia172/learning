def word_count(sentence)
  sentence.downcase!
  words = sentence.split

  result = {}

  words.each do |elem|
    if result.include?(elem)
      result[elem] += 1
    else
      result[elem] = 1
    end
  end
  result
end

print word_count('foo Foo bar bar Bar')
print word_count('Losowy ciąg znaków ciąg')
