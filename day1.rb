puts ARGF.read
  .split("\n\n")
  .map {|numbers_string| numbers_string.split.map(&:to_i)}
  .map {|numbers_array| numbers_array.sum}
  .max