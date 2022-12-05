priorities_string = (("a".."z").to_a+("A".."Z").to_a).join

puts ARGF.read
  .split("\n")
  .map {|rucksack| rucksack.chars}
  .each_slice(3)
  .flat_map {|elf_group| elf_group.reduce(&:&)}
  .map {|shared| priorities_string.index(shared)+1}
  .sum