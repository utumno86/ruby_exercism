# Class for returning the hamming difference number of a set of DNA and RNA
class Hamming
  def self.compute(string1, string2)
    raise ArgumentError if string1.length != string2.length
    string1.chars.zip(string2.chars).count { |i, j| i != j }
  end
end
