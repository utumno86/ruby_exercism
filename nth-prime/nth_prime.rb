# monkey-patch of actual prime class
class Prime
  @primes = [2]
  def self.nth(n)
    raise ArgumentError if n.zero?

    index = @primes[-1] == 2 ? 3 : @primes[-1]
    while @primes.length < n + 1
      is_prime = true
      @primes.each do |prime|
        if (index % prime).zero?
          is_prime = false
        end
      end

      if is_prime == true
        @primes << index
      end

      index += 2
    end
    @primes[n - 1]
  end
end

module BookKeeping
  VERSION = 1
end
