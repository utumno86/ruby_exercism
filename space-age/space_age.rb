class SpaceAge
  ORBITAL_PERIODS = {
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  def initialize(time_in_seconds)
    @time_in_seconds = time_in_seconds
  end

  def on_earth
    @time_in_seconds.to_f / 31_557_600.to_f
  end

  ORBITAL_PERIODS.each do |planet, orbital_period|
    define_method "on_#{planet}" do
      on_earth / orbital_period
    end
  end
end

class BookKeeping
  VERSION = 1
end
