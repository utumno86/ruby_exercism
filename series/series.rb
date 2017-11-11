# Class to return a series
class Series
  def initialize(series)
    @series = series.to_s
  end

  def slices(series_length)
    raise ArgumentError if series_length > @series.length
    (0..@series.length - series_length).collect do |i|
      @series[i...(i + series_length)]
    end
  end
end
