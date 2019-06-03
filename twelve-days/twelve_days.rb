# frozen_string_literal: true

# Programatically generates the lyrics to the twelve days of christmas
class TwelveDays
  DAYS = [
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
    'sixth',
    'seventh',
    'eighth',
    'ninth',
    'tenth',
    'eleventh',
    'twelfth'
  ].freeze

  GIFTS = [
    'a Partridge in a Pear Tree.',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ].freeze

  def self.song
    new.song
  end

  def song
    12.times.map(&method(:verse)).join("\n\n") + "\n"
  end

  def verse(index)
    "On the #{DAYS[index]} day of Christmas my true love gave to me: #{to_phrase(gifts(index+1))}"
  end

  def gifts(index)
    GIFTS.take(index).reverse
  end

  def to_phrase(gifts)
    *gifts, last_gift = gifts
    return last_gift if gifts.empty?

    gifts.join(', ') + ', and ' + last_gift
  end
end
