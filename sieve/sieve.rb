
# Class for implementing Eratosthene's Sieve
class Sieve
  def initialize(limit)
    @limit = limit
    @known_nonprimes = []
  end

  def primes
    puts @known_nonprimes
    (2..@limit).select { |n| prime?(n) }
  end

  def prime?(n)
    if !@known_nonprimes.include?(n) && (2..n / 2).none? { |i| (n % i).zero? }
      @known_nonprimes << n
      true
    else
      false
    end
  end
end

class BookKeeping
  VERSION = 1
end
