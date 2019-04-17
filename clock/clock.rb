class Clock
  def initialize(initial_clock_values = { hour: 0, minute: 0 })
    @total_minutes = total_minutes(initial_clock_values[:hour], initial_clock_values[:minute])
    @hours = 0
  end

  def to_s
    calculate_hours
    calculate_minutes
    "#{print_hours}:#{print_minutes}"
  end

  def +(other)
    hours, minutes = other.to_s.split(':')
    @total_minutes += total_minutes(hours, minutes)
    to_s
  end

  def -(other)
    hours, minutes = other.to_s.split(':')
    @total_minutes -= total_minutes(hours, minutes)
    to_s
  end

  def ==(other)
    other.to_s == to_s
  end

  private

  def total_minutes(hours, minutes)
    (hours.to_i * 60) + minutes.to_i
  end

  def calculate_hours
    @total_minutes < 0 ? negative_hours : positive_hours
  end

  def negative_hours
    while @total_minutes < -59
      @total_minutes += 60
      @hours -= 1
      normalize_hours
    end
  end

  def positive_hours
    while @total_minutes > 59
      @total_minutes -= 60
      @hours += 1
      normalize_hours
    end
  end

  def calculate_minutes
    if @total_minutes < 0
      @hours -= 1
      @total_minutes = 60 + @total_minutes
    else
      @total_minutes
    end
  end

  def print_hours
    normalize_hours
    @hours > 9 ? @hours.to_s : "0#{@hours}"
  end

  def print_minutes
    @total_minutes > 9 ? @total_minutes.to_s : "0#{@total_minutes}"
  end

  def normalize_hours
    @hours -= 24 if @hours >= 24
    @hours += 24 if @hours < 0
  end
end
