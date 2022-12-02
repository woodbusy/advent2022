def score_round(player1, player2)
  case([player1,player2])
  when [1,3]
    0
  when [3,1]
    6
  else
    player1==player2 ? 3 : (player1>player2 ? 0 : 6)
  end
end

puts ARGF.read
  .split("\n")
  .map {|game_string| game_string.split}
  .map {|player1,player2| [player1.ord-64, player2.ord-87]}
  .map {|player1,player2| [player2, score_round(player1, player2)]}
  .map {|round_score| round_score.sum}
  .sum
