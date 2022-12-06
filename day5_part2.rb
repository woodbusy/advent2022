lines = ARGF.read.split("\n")
separator_index = lines.index("")
crate_lines = lines[0..separator_index-2]
instruction_lines = lines[separator_index+1..]

stacks = crate_lines
  .map do |line|
    line
      .chars
      .each_slice(4)
      .to_a
      .map {|stack| stack[1]}
  end
  .transpose
  .map {|stack| stack.select {|crate| crate != " "}}

instruction_lines
  .map {|line| line.scan(/move (?<count>\d+) from (?<source>\d+) to (?<dest>\d+)/).first}
  .map {|instruction| instruction.map {|param| param.to_i}}
  .each do |count,source,dest|
    stacks[dest-1].unshift( *stacks[source-1].shift(count) )
  end

puts stacks
  .map {|stack| stack.shift}
  .join