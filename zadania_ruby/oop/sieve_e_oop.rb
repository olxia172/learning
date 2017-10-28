class Sieve
  def initialize(start, finish)
    @start = start
    @finish = finish
    @naturals = []

    if finish < start
      puts 'ERROR! Enter a smaller number first and then a larger one.'
    end
  end

  def result
    n = @naturals.join(", ")
    print "Prime numbers: #{n}\n"
  end

  def prime_num
    @naturals = (2..@finish).to_a

    index = 0
    while index < @naturals.length
      prime = @naturals[index]
      @naturals.reject! { |num| num % prime == 0 && num > prime }
      index += 1
    end

    @naturals.reject! { |num| num < @start }
    @naturals
  end
end

user_input = ARGV

start = user_input.first.to_i
finish = user_input.last.to_i

calculation1 = Sieve.new(start, finish)
calculation1.prime_num
calculation1.result
