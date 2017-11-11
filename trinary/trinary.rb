# Class for converting trinary number to decimal numbers
class Trinary
  def initialize(trinary)
    @trinary = trinary
  end

  def to_decimal
    decimal = 0
    @trinary.reverse!
    invalid = false
    (0...@trinary.length + 1).each do |digit|
      if @trinary[digit].to_i > 3 || @trinary[digit] =~ /\D/
        invalid = true
      end
      decimal += @trinary[digit].to_i * 3**digit
    end
    invalid ? 0 : decimal
  end
end

class BookKeeping
  VERSION = 1
end
