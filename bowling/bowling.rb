class Game
  attr_reader :score

  def initialize
    @score = 0
    @strikes = []
    @spares = 0
    @frame = 1
    @frame_score = 0
    @throw = 1
  end

  def roll(pins)
    # puts "Frame: #{@frame} Frame_Score: #{@frame_score} Strikes: #{@strikes} Spares #{@spares} Score #{@score}"
    scoring(pins)

    strikesspares(pins)

    game_status
  end

  def game_status
    if @throw == 2
      @frame += 1
      @frame_score = 0
      @throw = 0
    else
      @throw += 1
    end
  end

  def scoring(pins)
    if @frame < 8
      @score += pins
    end

    if @spares > 0
      @score += pins
      @spares -= 1
    end

    if @strikes.any? { |e| e > 0 }
      0.upto(@strikes.length - 1) do |i|
        unless (@strikes[i]).zero?
          @score += pins
          @strikes[i] -= 1
        end
      end
    end

    @frame_score += pins
  end

  def strikesspares(pins)
    if pins == 10
      @strikes.push(2)
    elsif @frame_score == 10
      @spares += 1
    end
  end
end
