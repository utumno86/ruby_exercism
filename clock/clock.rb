class Clock
  def initialize(input_hash)
    @hours = input_hash[:hour] || 0
    @minutes = process_minutes(input_hash[:minute] || 0)
  end

  def to_s
    "#{calculate_hours(@hours)}:#{calculate_minutes(@minutes)}"
  end

  def +(other)
    numbers = other.to_s.split(':')
    @hours += numbers[0].to_i
    @minutes = process_minutes(numbers[1].to_i)
    to_s
  end

  def -(other)
    numbers = other.to_s.split(':')
    @hours -= numbers[0].to_i
    @minutes = process_minutes(numbers[1].to_i, true)
    to_s
  end

  def ==(other_object)
    other_object.to_s == to_s
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
    if minutes > 0
      minutes < 10 ? "0#{minutes}" : minutes
    else
      '00'
    end
  end

  def process_minutes(minutes, subtract=false)
    total_minutes = process_total_minutes(minutes, subtract)
    while total_minutes >= 60
      @hours += 1
      total_minutes -= 60
    end
    while total_minutes < 0
      @hours -= 1
      total_minutes += 60
    end
    total_minutes
  end

  def process_total_minutes(minutes, subtract)
    if subtract
      @minutes ? (@minutes - minutes).to_i : minutes.to_i
    else
      @minutes ? (@minutes + minutes).to_i : minutes.to_i
    end
  end
end

module BookKeeping
  VERSION = 3
end
