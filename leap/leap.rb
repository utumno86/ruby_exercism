# monkey-patching Year class with a leap method
class Year
  def self.leap?(year)
    if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
      "Yes, #{year} is a leap year"
    end
  end
end

class BookKeeping
  VERSION = 2
end
