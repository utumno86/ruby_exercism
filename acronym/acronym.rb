#
class Acronym
  def self.abbreviate(name)
    name.split(' ').map { |compound_word| compound_word.split('-').map{ |word| word[0].upcase } }.join('')
  end
end
