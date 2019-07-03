# A Class that returns all of the prime factors
# of a given number
class PrimeFactors
  def self.for(number)
    new.for(number)
  end

  def for(number)
    prime_factors = []
    limit = number < 1000 ? number : Math.sqrt(number).to_i + 1_000_000
    (2..limit).each do |potential|
      while factor?(potential, number)
        prime_factors << potential
        number /= potential
      end
    end
    prime_factors
  end

  def factor?(potential, number)
    (number % potential).zero?
  end
end
