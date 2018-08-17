class Clock
  def initialize(input_hash)
    @hours = input_hash[:hour] || 0
    minutes = input_hash[:minute] || 0
    @minutes = process_minutes(minutes)
  end

  def to_s
    "#{calculate_hours(@hours)}:#{calculate_minutes(@minutes)}"
  end

  def +(other)
    numbers = other.to_s.split(':')
    @hours += numbers[0].to_i
    @minutes += process_minutes(numbers[1].to_i)
    to_s
  end

  def calculate_hours(hours)
    case hours
    when 0..9
      "0#{hours}"
    when 10..23
      hours.to_s
    else
      if hours > 0
        calculate_hours(hours - 24)
      else
        calculate_hours(24 + hours)
      end
    end
  end

  def calculate_minutes(minutes)
    if minutes
      minutes < 10 ? "0#{minutes}" : minutes
    else
      '00'
    end
  end

  def process_minutes(minutes)
    @hours += minutes / 60
    minutes % 60
  end

end
