module SavingsAccount
  def self.interest_rate(balance)
    case balance
    when 0..999.999
      0.5
    when 1000..4999.999
      1.621
    when 5000..Float::INFINITY
      2.475
    else
      3.213
    end
  end

  def self.annual_balance_update(balance)
    balance + (balance * interest_rate(balance) / 100)
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    years = 0
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      years += 1
    end
    years
  end
end
