liczba = gets.to_i

def fib(n)
  a, b = 0, 1
  puts a
  puts b

  i = 0

  while i < n - 2
    wynik = a + b
    puts wynik
    a = b
    b = wynik
    i += 1
  end
end

fib(liczba)
