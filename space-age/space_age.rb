class SpaceAge
  ORBITAL_PERIODS = {
    earth: 1.00,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  EARTH_YEAR_SECONDS = 31_557_600.to_f

  def initialize(time_in_seconds)
    @time_in_seconds = time_in_seconds
  end

  ORBITAL_PERIODS.each do |planet, orbital_period|
    define_method "on_#{planet}" do
      (@time_in_seconds.to_f / EARTH_YEAR_SECONDS) / orbital_period
    end
  end
end
