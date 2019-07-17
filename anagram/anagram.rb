# frozen_string_literal: true

# class to return whether or not a word is an anagram
class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.find_all{ |candidate| candidate.downcase.chars.sort.join == @word.downcase.chars.sort.join && candidate.downcase != @word.downcase }
  end
end
