# A Class depicting Bob the teenager
class Bob
  def self.hey(remark)
    new.hey(remark)
  end

  def hey(remark)
    if remark.upcase == remark && question?(remark) && non_alpha?(remark)
      "Calm down, I know what I'm doing!"
    elsif remark == remark.upcase && remark[0..-2].gsub(', ', '').to_i.to_s != remark[0..-2].gsub(', ', '') && non_alpha?(remark)
      'Whoa, chill out!'
    elsif question?(remark)
      'Sure.'
    elsif remark.strip == ''
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end

  def question?(remark)
    remark.strip[-1] == '?'
  end

  def non_alpha?(remark)
    remark.gsub(/[^A-Za-z]/, '').strip != ''
  end
end
