# monkey patch of roman numeral converter
class Integer
  NUMERAL_CONVERSION = {
    'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }.sort { |x, y| y[1] <=> x[1] }.to_h

  def to_roman
    num = self
    NUMERAL_CONVERSION.inject('') do |numerals, (letter, number)|
      while num >= number
        numerals << letter
        num -= number
      end
      numerals
    end
  end
end
