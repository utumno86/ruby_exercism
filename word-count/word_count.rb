# class for calculating the word count
class Phrase
  WORDS = /(?<=')[\w]+(?=')|(?!')[\w']+/

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.scan(WORDS)
    words.each_with_object(Hash.new(0)) do |word, counts|
      word = word.downcase
      counts[word] += 1
    end
  end
end

class BookKeeping
  VERSION = 1
end
