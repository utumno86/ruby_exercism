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
    full_song = ''
    accumulated_gifts = ''

    LYRICS.each do |line|
      if first_line?(line[1])
        accumulated_gifts = line[1]
      else
        accumulated_gifts = line[1] + ', ' + accumulated_gifts
      end
      full_song += "On the #{line[0]} day of Christmas my true love gave to me: #{accumulated_gifts}"
      if !last_line?(line[1])
        full_song += "\n\n"
      else
        full_song += "\n"
      end
      accumulated_gifts = 'and ' + accumulated_gifts if first_line?(line[1])
    end
    full_song
  end

  def self.first_line?(line)
    line == 'a Partridge in a Pear Tree.'
  end

  def self.last_line?(line)
    line == 'twelve Drummers Drumming'
  end
end
