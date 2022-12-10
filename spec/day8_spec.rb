require "advent2022/day8"

RSpec.describe Advent2022::Day8 do
  it "Part 1" do
    input = <<~EOF
      30373
      25512
      65332
      33549
      35390
      EOF

    expect(Advent2022::Day8.part1(input)).to eql(21)
  end

  context "Part 2" do
    it "gets the correct answer for the test input" do
      input = <<~EOF
        30373
        25512
        65332
        33549
        35390
        EOF

      expect(Advent2022::Day8.part2(input)).to eql(8)
    end

    context "scenic_score for specifc trees" do
      let(:forest) {
        [[3, 0, 3, 7, 3],
        [2, 5, 5, 1, 2],
        [6, 5, 3, 3, 2],
        [3, 3, 5, 4, 9],
        [3, 5, 3, 9, 0]]
      }

      it "correctly scores the first given example (1,2)" do
        expect(Advent2022::Day8.scenic_score(forest,1,2)).to eql(4)
      end

      it "correctly scores the second given example (3,2)" do
        expect(Advent2022::Day8.scenic_score(forest,3,2)).to eql(8)
      end
    end
  end
end