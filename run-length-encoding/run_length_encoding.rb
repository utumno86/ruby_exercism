module BookKeeping
  VERSION = 2
end

class RunLengthEncoding
  def initialize
  end

  def self.encode(input)
    letter_count = Hash.new(0)
    output = ''
    index = input[0]
    index_count = 0
    input.each_char do |letter|
      if letter != index[0]
        index = "#{letter}#{index_count}".to_s
        index_count += 1
      end
      letter_count[index] += 1
    end
    letter_count.each do |key, count|
      if count != 1
        output << count.to_s
      end
      output << key[0]
    end
    output
  end

  def self.decode(input)
    output = ''
    number = ''
    current_letter = ''
    input.each_char do |character|
      if character.is_number?
        number << character
      else
        if number == ''
          number = '1'
        end
        1.upto(number.to_i) do |index|
          output << character
        end
        number = ''
      end
    end
    output
  end
end

class String
  def is_number?
    true if Float(self) rescue false
  end
end
