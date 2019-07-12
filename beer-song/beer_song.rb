# Program that automatically generates the beer song.
class BeerSong
  def self.recite(initial_verse, number_of_iterations)
    new.recite(initial_verse, number_of_iterations)
  end

  def verse(verse_index)
    verse_index = verse_index.to_s
    if verse_index == '2'
      "#{verse_index} bottles of beer on the wall, #{verse_index} bottles of beer.\nTake one down and pass it around, #{verse_index.to_i - 1} bottle of beer on the wall.\n"
    elsif verse_index == '1'
      "#{verse_index} bottle of beer on the wall, #{verse_index} bottle of beer.\nTake it down and pass it around, no more bottles of beer on the wall.\n"
    elsif verse_index == '0'
      "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall.\n"
    else
      "#{verse_index} bottles of beer on the wall, #{verse_index} bottles of beer.\nTake one down and pass it around, #{verse_index.to_i - 1} bottles of beer on the wall.\n"
    end
  end

  def recite(initial_verse, number_of_iterations)
    result = ''
    verse_index = initial_verse
    number_of_iterations.times do |index|
      result += verse(verse_index)
      verse_index -= 1
      if number_of_iterations > index + 1
        result += "\n"
      end
    end
    result
  end
end
