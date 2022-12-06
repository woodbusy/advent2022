require "advent2022/day6"

RSpec.describe Advent2022::Day6 do
  context "Part 1" do
    {
      "mjqjpqmgbljsphdztnvjfqwrcgsmlb" => 7,
      "bvwbjplbgvbhsrlpgdmjqwftvncz" => 5,
      "nppdvjthqldpwncqszvftbrmjlhg" => 6,
      "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" => 10,
      "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" => 11,
    }.each do |input, expected_output|
      it "handles intput '#{input}' as expected" do
        expect(Advent2022::Day6.part1(input)).to eql(expected_output)
      end
    end
  end

  context "Part 2" do
    {
      "mjqjpqmgbljsphdztnvjfqwrcgsmlb" => 19,
      "bvwbjplbgvbhsrlpgdmjqwftvncz" => 23,
      "nppdvjthqldpwncqszvftbrmjlhg" => 23,
      "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg" => 29,
      "zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw" => 26,
    }.each do |input, expected_output|
      it "handles intput '#{input}' as expected" do
        expect(Advent2022::Day6.part2(input)).to eql(expected_output)
      end
    end
  end
end