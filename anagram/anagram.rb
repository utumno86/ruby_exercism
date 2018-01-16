class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    matches = []
    candidates.each do |candidate|
      if candidate.downcase.chars.sort.join == @word.downcase.chars.sort.join && candidate.downcase != @word.downcase
        matches.push(candidate)
      end
    end
    matches
  end
end

class BookKeeping
  VERSION = 2
end