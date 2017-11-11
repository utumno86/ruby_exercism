# A Class that returns all of the prime factors
# of a given number
class PrimeFactors
  def self.for(number)
    prime_factors = []
    (2..number).each do |potential|
      while factor?(potential, number)
        prime_factors << potential
        number /= potential
      end
    end
    prime_factors
  end

  def self.factor?(potential, number)
    (number % potential).zero?
  end
end
