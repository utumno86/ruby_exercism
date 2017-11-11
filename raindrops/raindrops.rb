# Class to produce the correct number of raindrop noises
class Raindrops
  SOUNDS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  def self.convert(raindrops)
    answer = SOUNDS.each_with_object('') do |(factor, sound), result|
      result << sound if (raindrops % factor).zero?
    end
    answer.empty? ? raindrops.to_s : answer
  end
end

class BookKeeping
  VERSION = 3
end
