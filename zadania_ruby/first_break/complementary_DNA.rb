BASES = {
  "A" => "G",
  "G" => "A",
  "C" => "T",
  "T" => "C"
}

def complementary_base(base)
  BASES[base] || '?'
end



def complementary_dna(dna)
  dna.chars.map { |base| complementary_base(base) }.join
end

puts complementary_dna('ATTA')
puts complementary_dna('GCCTTAAATAGC')
puts complementary_dna('ssssssssss')
