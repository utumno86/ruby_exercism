class Game
  attr_reader :score

  def initialize
    @score = 0
    @strikes = 0
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
    @score += pins

    if @spares > 0
      @score += pins
      @spares -= 1
    end

    @frame_score += pins
  end

  def strikesspares(pins)
    if pins == 10
      @strikes += 1
    elsif @frame_score == 10
      @spares += 1
    end
  end
  
end
