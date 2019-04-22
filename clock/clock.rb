class Clock
  attr_reader :minutes

  def initialize(hour: 0, minute: 0)
    @minutes = (hour * 60) + minute
  end

  def to_s
    hours = (@minutes / 60) % 24
    minutes = @minutes % 60
    format('%02d:%02d', hours, minutes)
  end

  def +(other)
    @minutes += other.minutes
    to_s
  end

  def -(other)
    @minutes -= other.minutes
    to_s
  end

  def ==(other)
    to_s == other.to_s
  end
end
