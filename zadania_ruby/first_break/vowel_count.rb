def vowel_count(word)
  vowels = ["a", "e", "i", "o", "u", "y"]
  word.downcase!
  counter = 0
  word.each_char do |letter|
    if vowels.include?(letter)
      counter += 1
    end
  end
  return counter
end

puts vowel_count('Aleksandra')
