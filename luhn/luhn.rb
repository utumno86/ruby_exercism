# Class for determining the validity of credit card numbers
class Luhn
  def self.valid?(number_string)
    stripped_number_string = number_string.gsub(/\D/, '')
    return false unless stripped_number_string.length > 1
    return false if number_string.match(/[^0-9 ]/)

    numbers = stripped_number_string.each_char.map(&:to_i)
    doubled_numbers = double_every_other_digit(numbers)
    (doubled_numbers.sum % 10).zero?
  end

  def self.double_every_other_digit(numbers)
    numbers.reverse.map.with_index do |number, index|
      if index.odd?
        number * 2 > 9 ? (number * 2) - 9 : number * 2
      else
        number
      end
    end
  end
end
