class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.find_all{ |candidate| candidate.downcase.chars.sort.join == @word.downcase.chars.sort.join && candidate.downcase != @word.downcase }
  end
end

class BookKeeping
  VERSION = 2
end