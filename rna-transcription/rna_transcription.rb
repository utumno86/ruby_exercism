# class for RNA Transacription
class Complement
  @dna_chars = 'GCTA'
  @rna_chars = 'CGAU'

  def self.of_dna(dna_strand)
    Complement.invalid_input(dna_strand) ? '' : dna_strand.tr(@dna_chars, @rna_chars)
  end

  def self.invalid_input(dna_strand)
    dna_strand.chars.any? { |x| !@dna_chars.include?(x) }
  end
end
