class Year
  def self.leap?(year)
    if (year % 4).zero? && (year % 100 != 0 || year % 400 == 0)
      "Yes, #{year} is a leap year"
    end
  end
end
