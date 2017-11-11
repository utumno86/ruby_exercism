# Extract Transform Load script
class ETL
  def self.transform(old)
    new = Hash.new(0)
    old.each do |key, value|
      value.each do |letter|
        new[letter.downcase] += key
      end
    end
    new
  end
end

class BookKeeping
  VERSION = 1
end
