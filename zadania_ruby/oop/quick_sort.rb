require "pry"
class QuickSort
  attr_accessor :to_sort, :right, :left

  def initialize(user_input)
    @to_sort = []
    @user_input = user_input
    array_to_sort
    @right = @to_sort.size - 1
    @left = 0
  end

  def array_to_sort
    @user_input.each { |elem| @to_sort << elem.to_i }
    @to_sort
  end

  def sort!
    quick_sort(@to_sort, @left, @right)
  end

  private

  def quick_sort(to_sort, left, right)
    i = (left + right) / 2
    pivot = to_sort[i]
    to_sort[i], to_sort[right] = to_sort[right], to_sort[i]
    j = i = left

    while i < right
      if to_sort[i] < pivot
        to_sort[i], to_sort[j] = to_sort[j], to_sort[i]
        j += 1
      end
      i += 1
    end
    to_sort[right], to_sort[j] = to_sort[j], pivot

    to_sort = quick_sort(to_sort, left, j - 1) if left < j - 1
    to_sort = quick_sort(to_sort, j + 1, right) if j + 1 < right
    to_sort
  end
end

sortowanie = QuickSort.new(ARGV)
puts sortowanie.sort!
