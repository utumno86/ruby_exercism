# frozen_string_literal: true

# Class for creating a binary search tree
class Bst
  def initialize(input_data)
    @array_index = 0
    @data_array = [input_data]
  end

  def insert(new_data)
    if new_data > data
      @data_array.push(new_data)
    elsif new_data <= data
      @data_array.unshift(new_data)
      @array_index += 1
    end
  end

  def left
    @array_index -= 1
    self
  end

  def right
    @array_index += 1
    self
  end

  def data
    @data_array[@array_index]
  end
end
