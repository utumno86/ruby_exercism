class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @array_index = 0
    @data_array = [data]
    @data = @data_array[@array_index]
  end

  def insert(new_data)
    index = @data_array[@array_index]
    if new_data > index
      @data_array.push(new_data)
    elsif new_data < index
      @data_array.unshift(new_data)
      @array_index += 1
    end
  end

  def left
    @data = @data_array[@array_index - 1]
  end

  def right
    @data = @data_array[@array_index + 1]
  end

end
