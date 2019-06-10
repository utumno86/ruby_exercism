# Class for calculating a gigasecond added to a given date
class Gigasecond
  GIGASECOND = 10**9
  def self.from(time)
    time + GIGASECOND
  end
end
