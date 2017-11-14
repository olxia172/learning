VOWELS = ["a", "e", "i", "o", "u", "y"]
def vowel_count(word)
  word.downcase!
  counter = 0
  word.each_char do |letter|
    if VOWELS.include?(letter)
      counter += 1
    end
  end
  return counter
end

puts vowel_count('Aleksandra')
