# Program that automatically generates the beer song.
class BeerSong
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

  def verses(initial_verse, ending_verse)
    index = initial_verse.to_i
    result = ''
    while index >= ending_verse.to_i
      result += verse(index.to_s)
      if index != ending_verse.to_i
        result += "\n"
      end
      index -= 1
    end
    result
  end
end

class BookKeeping
  VERSION = 3
end
