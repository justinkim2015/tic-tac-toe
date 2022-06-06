require_relative './player'
require_relative './board'

player_one = Player.new
player_two = Player.new

loop do
  break unless player_two.piece == player_one.piece

  puts 'Sorry, that symbol is unavailable'
  player_two.ask_piece(player_two.name)
end

board = Board.new
board.array_values
board.drawboard

loop do
  board.take_turn(player_one.choose_number, board, player_one.piece)
  if board.is_winner?(player_one.piece, player_one.name)
    break
  elsif board.is_tie?
    break
  end
  board.take_turn(player_two.choose_number, board, player_two.piece)
  if board.is_winner?(player_two.piece, player_two.name)
    break
  elsif board.is_tie?
    break
  end
end