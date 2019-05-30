# frozen_string_literal: true

# Programatically generates the lyrics to the twelve days of christmas
class TwelveDays
  LYRICS = [
    ['first', 'and a Partridge in a Pear Tree.'],
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
    12.times.map { |index| verse(index) }.join("\n\n") + "\n"
  end

  def verse(index)
    "On the #{LYRICS[index][0]} day of Christmas my true love gave to me: #{to_phrase(gifts(index))}"
  end

  def gifts(index)
    (index + 1).times.map { |gift_index| LYRICS[gift_index][1] }
  end

  def to_phrase(gifts)
    gifts[0] = gifts[0][4..-1] if gifts.length == 1
    gifts.reverse.join(', ')
  end

  def add_lyrics(index)
    LYRICS[index][1] + ', '
  end
end
