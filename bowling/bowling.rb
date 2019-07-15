class Game
  def initialize
    @score = 0
    @strikes = []
    @spares = 0
    @frame = 1
    @frame_score = 0
    @throw = 1
  end

  def roll(pins)
    raise BowlingError, "This throw has occured after the game is over" if @frame > 10 && @strikes.none? { |e| e > 0 } && @spares.zero?
    raise BowlingError, "#{pins} pins is an invalid number of pins" if pins < 0 || pins > 10

    scoring(pins)

    raise BowlingError, "#{@frame_score} is more than 10" if @frame_score > 10

    strikesspares(pins)

    game_status
  end

  def game_status
    if @throw == 2
      @frame += 1
      @frame_score = 0
      @throw = 1
    else
      @throw += 1
    end
  end

  def scoring(pins)
    if @spares > 0
      @score += pins
      @spares -= 1
    end

    if @frame <= 10
      @score += pins

      if @strikes.any? { |e| e > 0 } && !(@frame >= 10 && @throw == 2)
        0.upto(@strikes.length - 1) do |i|
          unless (@strikes[i]).zero?
            @score += pins
            @strikes[i] -= 1
          end
        end
      end
    elsif @frame == 11
      if @strikes.any? { |e| e > 0 } || @spares > 0
        0.upto(@strikes.length - 1) do |i|
          unless (@strikes[i]).zero?
            @score += pins
            @strikes[i] -= 1
          end
        end
      end
    elsif @frame == 12 && @strikes.any? { |e| e > 0 }
      @score += pins
    end

    @frame_score += pins
  end

  def strikesspares(pins)
    if pins == 10
      @strikes.push(2)
      @throw = 2
    elsif @frame_score == 10
      @spares += 1
    end
  end

  def score
    raise BowlingError, "Game not complete" if @frame < 10
    raise BowlingError, "Bonus Rolls must be made before scores can be calculated" if (@frame == 10 || @frame == 11) && (@spares > 0 || @strikes.any? { |e| e > 0 })
    raise BowlingError, "Bonus Rolls must be made before scores can be calculated" if @frame == 12 && @strikes.any? { |e| e > 1 } && (@strikes.length > 1 && @frame_score == 0)

    @score
  end
end

class Game::BowlingError < StandardError; end