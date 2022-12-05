priorities_string = (("a".."z").to_a+("A".."Z").to_a).join

puts ARGF.read
  .split("\n")
  .map {|rucksack| rucksack.chars.each_slice(rucksack.length/2).to_a}
  .flat_map {|compartment1,compartment2| compartment1 & compartment2}
  .map {|shared| priorities_string.index(shared)+1}
  .sum