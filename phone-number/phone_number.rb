# Phone Number class
class PhoneNumber
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def number
    strip_all(@phone_number)
    default if (@phone_number.include? 'a') || (@phone_number.length < 10) || (@phone_number.length > 11) || (@phone_number.length == 11 && @phone_number[0] != "1")
    if (@phone_number.length == 11)
      @phone_number = truncate_number(@phone_number)
    end
    @phone_number
  end

  def area_code
    number
    @phone_number[0..2]
  end

  def to_s
    number
    "(#{@phone_number[0..2]}) #{@phone_number[3..5]}-#{@phone_number[6..9]}"
  end

  private

  def strip_all(phone_number)
    strip_characters = [' ', '(', ')', '.', '-']
    strip_characters.each do |char|
      phone_number.gsub! char, ''
    end
    phone_number
  end

  def truncate_number(phone_number)
    phone_number[1..-1]
  end

  def default
    @phone_number = '0000000000'
  end
end
