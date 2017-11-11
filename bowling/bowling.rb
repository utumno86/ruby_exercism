# Class to record a game of bowling
class Game
  def initialize
    @score = 0
    @frame_score = 0
    @ball_count = 1
    @frame_count = 1
    @strike_score_count = []
    @spare_score_count = 0
    @post_game_strike_bonus = 0
  end

  class BowlingError < StandardError; end

  def roll(pins)
    raise BowlingError, "#{pins} pins is an invalid number of pins" if pins < 0 || pins > 10
    @frame_score += pins
    raise BowlingError, "#{@frame_score} is more than 10" if @frame_score > 10 && @frame_count < 9

    if @spare_score_count > 0
      @score += pins
      @spare_score_count -= 1
    end

    if @strike_score_count.any? { |e| e > 0  }
      puts "strike_score_count #{@strike_score_count}"
      0.upto(@strike_score_count.length-1) do |i|
        puts @strike_score_count[i]
        unless (@strike_score_count[i]).zero?
          puts "strike bonus #{pins} strike count #{@strike_score_count[i]}"
          @score += pins
          @strike_score_count[i] -= 1
        end
      end
    end

    if @frame_count < 9
      puts "Frame count #{@frame_count} frame score #{@frame_score}"
      if @frame_score < 10 && pins != 10
        @score += pins
      elsif @frame_score == 10 && pins < 10
        @spare_score_count += 1
        @score += pins
      else
        @strike_score_count.push(2)
        @ball_count = 2
        @score += pins
      end
    elsif @frame_count > 10 && @frame_score > 10
      raise BowlingError
    else
      if pins != 10 && @frame_score == 10
        @post_game_strike_bonus += pins
      end
      @score += pins
    end

    raise BowlingError if @post_game_strike_bonus > 10
    puts "pins #{pins}"
    puts "total score #{@score}"
    @ball_count += 1

    if @ball_count == 3
      @ball_count = 1
      @frame_score = 0
      @frame_count += 1
    end
  end

  def score
    @score
  end
end
