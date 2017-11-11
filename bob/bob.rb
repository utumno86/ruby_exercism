# A Class depicting Bob the teenager
class Bob
  def initialize
  end

  def hey(remark)
    if remark == remark.upcase && remark[0..-2].gsub(', ', '').to_i.to_s != remark[0..-2].gsub(', ', '') && remark.strip != ''
      'Whoa, chill out!'
    elsif remark[-1] == '?'
      'Sure.'
    elsif remark.strip == ''
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
