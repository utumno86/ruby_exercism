# Class for determining the validity of credit card numbers
class Luhn
  def self.valid?(number_string)
    Luhn.new(number_string).valid?
  end

  def initialize(number_string)
    @number_string = number_string
  end

  def valid?
    return false unless clean?

    (checksum % 10).zero?
  end

  def checksum
    number_array.reverse.each_slice(2).sum { |first, second=0| first + double_less_than_nine(second) }
  end

  def clean?
    long_enough? && only_numbers_and_spaces?
  end

  def long_enough?
    stripped_number_string.length > 1
  end

  def double_less_than_nine(number)
    doubled = number * 2
    doubled > 9 ? doubled - 9 : doubled
  end

  def only_numbers_and_spaces?
    !@number_string.match(/[^0-9 ]/)
  end

  def stripped_number_string
    @stripped_number_string || @number_string.gsub(/\D/, '')
  end

  def number_array
    @number_array || stripped_number_string.each_char.map(&:to_i)
  end
end
