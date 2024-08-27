class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    value = ''
    case operation
    when '+'
      value = self.addition(first_operand, second_operand)
    end

    "#{first_operand} #{operation} #{second_operand} = #{value}"
  end

  private

  def self.addition(first, second)
    first.to_i + second.to_i
  end

end
