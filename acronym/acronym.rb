#
class Acronym
  def self.abbreviate(name)
    name.scan(/\b\w/).map(&:upcase).join('')
  end
end
