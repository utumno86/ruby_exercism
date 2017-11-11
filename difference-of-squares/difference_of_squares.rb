# Class to determine the difference of squares
class Squares
  def initialize(nums)
    @nums = nums
  end

  def square_of_sum
    @nums.zero? ? 0 : ((1..@nums).inject { |num, n| num + n })**2
  end

  def sum_of_squares
    @nums.zero? ? 0 : ((1..@nums).inject { |num, n| num + n**2 })
  end

  def difference
    square_of_sum - sum_of_squares
  end
end

class BookKeeping
  VERSION = 3
end
