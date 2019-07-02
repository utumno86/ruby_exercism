# Phone Number class
class PhoneNumber

  def self.clean(phone_number)
    new.clean(phone_number)
  end

  def clean(phone_number)
    phone_number = strip_all(phone_number)
    return nil if (phone_number.include? 'a') || (phone_number.length < 10) || (phone_number.length > 11)

    if phone_number.length == 11
      return nil if phone_number[0] != '1' || phone_number[4] == '0' || phone_number[4] == '1' || phone_number[1] == '0' || phone_number[1] == '1'

      truncate_number(phone_number)
    else
      return nil if phone_number[0] == '1' || phone_number[0] == '0' || phone_number[3] == '0' || phone_number[3] == '1'

      phone_number
    end
  end

  private

  def strip_all(phone_number)
    strip_characters = [' ', '(', ')', '.', '-', '+']
    strip_characters.each do |char|
      phone_number.gsub! char, ''
    end
    phone_number
  end

  def truncate_number(phone_number)
    phone_number[1..-1]
  end
end
