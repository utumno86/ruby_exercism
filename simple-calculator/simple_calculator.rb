class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError if first_operand.to_i != first_operand or second_operand.to_i != second_operand
    value = ''
    case operation
    when '+'
      value = self.addition(first_operand, second_operand)
    when '/'
      return "Division by zero is not allowed." if second_operand == 0
      value = self.division(first_operand, second_operand)
    when '*'
      value = self.multiplication(first_operand, second_operand)
    end

    "#{first_operand} #{operation} #{second_operand} = #{value}"
  end

  private

  def self.addition(first, second)
    first + second
  end

  def self.division(first, second)
    first / second
  end

  def self.multiplication(first, second)
    first * second
  end
end
