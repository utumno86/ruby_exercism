# Sum of Multiples class
class SumOfMultiples
  def initialize(*factors)
    @factors = factors
  end

  def to(limit)
    list_of_multiples = (0...limit).select do |i|
      return_factors(i)
    end
    list_of_multiples.inject(0, :+)
  end

  private

  def return_factors(i)
    return 0 unless i.poitive?

    @factors.any? { |factor| (i % factor).zero? }
  end
end
