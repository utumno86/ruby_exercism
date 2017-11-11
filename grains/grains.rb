# grain class for calculating the thing
class Grains
  def self.square(n)
    total = 1
    if n > 1
      (n - 1).times do
        total *= 2
      end
    end
    total
  end

  def self.total
    Grains.square(65) - 1
  end
end
