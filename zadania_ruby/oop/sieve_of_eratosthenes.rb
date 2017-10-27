user_input = ARGV

num1 = user_input.first.to_i
num2 = user_input.last.to_i

def range_numbers(num1, num2)
  index = 0
  if num1 <= 1
    array = [2]
    num1 = 2
  else
    array = [num1]
  end

  while array[index] < num2
    num1 += 1
    array << num1
    index += 1
  end
  return array
end

def elimination(num)
  i = 0
  divisors = [2, 3, 5, 7]

  if divisors.include?(num)
    return false
  else
    while i < divisors.size
      result = num % divisors[i]
      if result.zero?
        return true
      else
        i += 1
      end
    end
  end
end

def sieve(num1, num2)
  if num1 > num2
    puts 'ERROR! Enter a smaller number first and then a larger one.'
  else
    numbers = range_numbers(num1, num2)
    elimination = numbers.delete_if { |num| elimination(num) }
    prime_numbers = elimination.join(", ")
    print "Prime numbers: #{prime_numbers}\n"
  end
end

sieve(num1, num2)
