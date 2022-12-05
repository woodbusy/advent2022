def to_ruby_range(string_range)
  limits = string_range.split("-").map(&:to_i)
  Range.new(*limits)
end

puts ARGF.read
  .split("\n")
  .map {|range_pairs| range_pairs.split(",")}
  .map {|range_pair| range_pair.map {|range| to_ruby_range(range)}}
  .select {|range1,range2| range1.include?(range2.first) || range1.cover?(range2.last) || range2.include?(range1.first) || range2.cover?(range1.last)}
  .count