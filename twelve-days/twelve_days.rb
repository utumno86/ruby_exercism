# frozen_string_literal: true

# Programatically generates the lyrics to the twelve days of christmas
class TwelveDays
  LYRICS = [
    ['first', 'a Partridge in a Pear Tree.'],
    ['second', 'two Turtle Doves'],
    ['third', 'three French Hens'],
    ['fourth', 'four Calling Birds'],
    ['fifth', 'five Gold Rings'],
    ['sixth', 'six Geese-a-Laying'],
    ['seventh', 'seven Swans-a-Swimming'],
    ['eighth', 'eight Maids-a-Milking'],
    ['ninth', 'nine Ladies Dancing'],
    ['tenth', 'ten Lords-a-Leaping'],
    ['eleventh', 'eleven Pipers Piping'],
    ['twelfth', 'twelve Drummers Drumming']
  ].freeze

  def self.song
    new.song
  end

  def song
    12.times.map { |index| verse(index) }.join("\n\n")
  end

  def verse(index)
    "On the #{LYRICS[index][0]} day of Christmas my true love gave to me: #{accumulated_gifts(index)}"
  end

  def accumulated_gifts(index)
    case index
    when 0
      @gifts = LYRICS[0][1]
    when 1
      @gifts = add_lyrics(index) + 'and ' + @gifts
    when 11
      @gifts = add_lyrics(index) + @gifts + "\n"
    else
      @gifts = add_lyrics(index) + @gifts
    end
  end

  def add_lyrics(index)
    LYRICS[index][1] + ', '
  end
end
