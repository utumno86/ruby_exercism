class Matrix
  attr_reader :rows
  attr_reader :columns

  def initialize(matrix_string)
    @rows = matrix_rows(matrix_string).map { |line| line.split(' ').map(&:to_i) }
    @columns = column_calc(matrix_rows(matrix_string))
  end

  def matrix_rows(matrix_string)
    matrix_string.split("\n")
  end

  def column_calc(lines)
    columns = []
    lines.each do |line|
      line.split(' ').each_with_index do |num, index|
        columns[index] ||= []
        columns[index] << num.to_i
      end
    end
    columns
  end

end
