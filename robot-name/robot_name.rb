# this class is a Robot
class Robot
  attr_reader :name
  @names_list = []

  def initialize
    @name = [*('A'..'Z')].sample(2).join + [*('0'..'9')].sample(3).join
    if self.class.names_list.include?(@name)
      initialize
    else
      self.class.names_list << @name
    end
  end

  def reset
    initialize
  end

  def self.names_list
    @names_list
  end
end

class BookKeeping
  VERSION = 2
end
