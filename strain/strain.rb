# monkey patch of class array
class Array
  def keep
    solution = []
    each { |element| solution << element if yield(element) }
    solution
  end

  def discard
    solution = []
    each { |element| solution << element unless yield(element) }
    solution
  end
end
