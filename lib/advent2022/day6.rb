module Advent2022
  class Day6
    def self.part1(input)
      start_marker = input[4..]
        .chars
        .each_with_object(input[0..3].chars) do |char,last4|
          unless last4.uniq.length==4
            last4.shift
            last4.append(char)
          end
        end.join
      input.index(start_marker) + start_marker.length
    end

    def self.part2(input)
      start_marker = input[14..]
        .chars
        .each_with_object(input[0..13].chars) do |char,last14|
          unless last14.uniq.length==14
            last14.shift
            last14.append(char)
          end
        end.join
      input.index(start_marker) + start_marker.length
    end
  end
end

if __FILE__ == $0
  case(ARGV.shift.to_i)
  when 1
    puts Advent2022::Day6.part1(ARGF.read)
  when 2
    puts Advent2022::Day6.part2(ARGF.read)
  else
    raise "First command-line argument must be 1 or 2"
  end
end