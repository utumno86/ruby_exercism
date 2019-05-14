# Class for testing whether or not a string is an isogram
class Isogram
  def self.isogram?(test_string)
    normalize(test_string).chars.uniq.length == normalize(test_string).length
  end

  def self.normalize(test_string)
    test_string.gsub(/\W/, '').downcase
  end
end
