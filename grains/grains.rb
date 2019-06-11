# frozen_string_literal: true

# grain class for calculating the thing
class Grains
  def self.square(num)
    raise ArgumentError, 'Argument must be between 1 and 64, inclusive' unless num > 0 && num < 65

    new.square(num)
  end

  def self.total
    new.square(65) - 1
  end

  def square(num)
    2**(num - 1)
  end
end
