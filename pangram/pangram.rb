require 'set'

# class for detecting a Pangram
class Pangram
  ALPHABET = Set.new('a'..'z')
  def self.pangram?(phrase)
    ALPHABET.subset? Set.new(phrase.downcase.chars)
  end
end

class BookKeeping
  VERSION = 4
end
