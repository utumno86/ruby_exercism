# frozen_string_literal: true

# Class for determining the validity of credit card numbers
class Luhn
  def self.valid?(number_string)
    Luhn.new(number_string).valid?
  end

  def initialize(number)
    @number = number
  end

  def valid?
    return false unless long_enough? && only_numbers_and_spaces?

    (checksum % 10).zero?
  end

  def checksum
    digits.reverse.each_slice(2).sum { |first, second=0| first + double(second) }
  end

  def long_enough?
    stripped_number.length > 1
  end

  def double(digit)
    doubled = digit * 2
    doubled > 9 ? doubled - 9 : doubled
  end

  def only_numbers_and_spaces?
    !@number.match(/[^0-9 ]/)
  end

  def stripped_number
    @stripped_number ||= @number.gsub(/\D/, '')
  end

  def digits
    @digits ||= stripped_number.each_char.map(&:to_i)
  end
end
