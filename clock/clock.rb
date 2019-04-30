class Clock
  attr_reader :minutes

  def initialize(hour: 0, minute: 0)
    @minutes = (hour * 60) + minute
  end

  def to_s
    format '%02i:%02i' % [hours, only_minutes]
  end

  def +(other)
    @minutes += other.minutes
    to_s
  end

  def -(other)
    @minutes += (-1 * other.minutes)
    to_s
  end

  def ==(other)
    to_s == other.to_s
  end

  def hours
    (@minutes / 60) % 24
  end

  def only_minutes
    @minutes % 60
  end
end
