#
class Acronym
  def self.abbreviate(name)
    name.scan(/\w+/).map { |word| word[0].upcase }.join('')
  end
end
