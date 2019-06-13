# this class is a Robot
class Robot
  attr_reader :name

  def initialize
    @name = @@names_list.pop
  end

  def reset
    initialize
  end

  def self.forget
    @@names_list = ('AA000'..'ZZ999').to_a.shuffle
  end
end