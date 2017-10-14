n = gets.to_i

def fib(n)
  a, b = 0, 1
  i = 1
  puts a
  puts b

  loop do
    wynik = a + b
    puts wynik
    a = b
    b = wynik
    i += 1
    break if i == n - 1
  end
end

fib(n)
