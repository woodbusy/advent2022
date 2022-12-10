module Advent2022
  module Day8
    def self.find_visible_trees_by_row(trees)
      visible_trees = Array.new(trees.length) {Array.new(trees.first.length,0)}
      trees_transposed = trees.transpose

      num_rows = trees.length
      num_cols = trees_transposed.length

      num_rows.times do |row_itr|
        num_cols.times do |col_itr|
          if [0, num_rows].include?(row_itr) || [0, num_cols].include?(col_itr)
            visible_trees[row_itr][col_itr] = 1
            next
          end

          row = trees[row_itr]
          col = trees_transposed[col_itr]
          target_tree = trees[row_itr][col_itr]

          if row[0..col_itr-1].none? {|other| other >= target_tree} || 
              row[col_itr+1..].none? {|other| other >= target_tree} ||
              col[0..row_itr-1].none? {|other| other >= target_tree} || 
              col[row_itr+1..].none? {|other| other >= target_tree}
            
            visible_trees[row_itr][col_itr] = 1
          end
        end
      end

      visible_trees
    end

    def self.part1(input)
      trees = input.split.map(&:chars).map {|row| row.map(&:to_i)}

      visible_trees = find_visible_trees_by_row(trees)
      visible_trees.flatten.sum
    end






    def self.count_visible_trees_from_height(trees, viewing_height)
      return 0 if trees.empty?
      stop_index = trees.index {|other| other >= viewing_height} || trees.length-1
      stop_index+1
    end

    def self.scenic_score(forest, row_index, col_index)
      forest_transposed = forest.transpose
      viewing_tree = forest[row_index][col_index]

      north = forest_transposed[col_index][0,row_index].reverse
      south = forest_transposed[col_index][row_index+1..]
      west = forest[row_index][0,col_index].reverse
      east = forest[row_index][col_index+1..]

      scenic_score = [north, west, south, east]
        .map {|trees| count_visible_trees_from_height(trees, viewing_tree)}

      scenic_score
        .reduce(&:*)
    end

    def self.part2(input)
      forest = input.split.map(&:chars).map {|row| row.map(&:to_i)}

      scenic_scores = Array.new(forest.length) {Array.new(forest.first.length,nil)}
      forest_transposed = forest.transpose
      
      forest.length.times do |row_itr|
        forest_transposed.length.times do |col_itr|
          scenic_scores[row_itr][col_itr] = scenic_score(forest, row_itr, col_itr)
        end
      end

      scenic_scores.flatten.max
    end
  end
end

if __FILE__ == $0
  case(ARGV.shift.to_i)
  when 1
    puts Advent2022::Day8.part1(ARGF.read)
  when 2
    puts Advent2022::Day8.part2(ARGF.read)
  else
    raise "First command-line argument must be 1 or 2"
  end
end