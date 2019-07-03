require 'prime'

# A Class that returns all of the prime factors
# of a given number
class PrimeFactors
  def self.for(number)
    new.for(number)
  end

  def for(number)
    number.prime_division.flat_map { |cords| Array.new(cords[1]) { cords[0] } }
  end
end
