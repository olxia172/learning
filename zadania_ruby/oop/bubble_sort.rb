class BubbleSort
  def initialize(user_input)
    @numbers = user_input
  end

  def sort
    iteration = 1
    while iteration < @numbers.size
      index = 0
      while index < @numbers.size - 1
        if @numbers[index].to_i > @numbers[index + 1].to_i
          @numbers[index], @numbers[index + 1] = @numbers[index + 1], @numbers[index]
        end
        index += 1
      end
      iteration += 1
    end
    @numbers.join(" ")
  end
end

numbers = BubbleSort.new(ARGV)
print numbers.sort
