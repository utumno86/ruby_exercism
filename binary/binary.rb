class Binary
  def initialize(binary_number)
    fail ArgumentError.new("#{binary_number} is not a valid binary digit") unless self.valid(binary_number)
    @binary_number = binary_number.to_s.reverse
  end

  def to_decimal
    decimal = 0
    0.upto(@binary_number.length) do |index|
      if @binary_number[index] == "1"
        decimal += 2**index
      end
    end
    decimal
  end

  def valid(number)
    number.to_s.each_char do |digit|
      unless digit == "1" || digit == "0"
        return false
      end
    end
  end

end
class BookKeeping
  VERSION = 2
end
