class Board
  attr_accessor :board

  def initialize
    @board = Array.new(3) {Array.new(3, 0)}
  end

  def array_values
    @board[0][0] = 1
    @board[0][1] = 2
    @board[0][2] = 3
    @board[1][0] = 4
    @board[1][1] = 5
    @board[1][2] = 6
    @board[2][0] = 7
    @board[2][1] = 8
    @board[2][2] = 9
  end

  def drawboard
    @board.each do |row|
      print '| '
      row.each do |value|
        print "#{value} | "
      end
      puts "\n------------"
    end
  end

  def update_board(index_one, index_two, new_value)
    @board[index_one][index_two] = new_value
    drawboard
  end

  def take_turn(number, board, player_piece)
    if board.position_empty?(number)
      board.place_piece(number, player_piece)
    else
      puts 'INVALID PLACEMENT, INPUT AGAIN'
      new_number = gets.chomp.to_i
      take_turn(new_number, board, player_piece)
    end
  end

  def position_empty?(number)
    true if value_via(number) != 'X' && value_via(number) != 'O'
  end

  def value_via(number)
    if number == 1
      @board[0][0]
    elsif number == 2
      @board[0][1]
    elsif number == 3
      @board[0][2]
    elsif number == 4
      @board[1][0]
    elsif number == 5
      @board[1][1]
    elsif number == 6
      @board[1][2]
    elsif number == 7
      @board[2][0]
    elsif number == 8
      @board[2][1]
    elsif number == 9
      @board[2][2]
    end
  end

  def place_piece(number, player_piece)
    if number == 1
      self.update_board(0,0, player_piece)
    elsif number == 2
      self.update_board(0,1, player_piece)
    elsif number == 3  
      self.update_board(0,2, player_piece)
    elsif number == 4  
      self.update_board(1,0, player_piece)
    elsif number == 5  
      self.update_board(1,1, player_piece)
    elsif number == 6  
      self.update_board(1,2, player_piece)
    elsif number == 7  
      self.update_board(2,0, player_piece)
    elsif number == 8  
      self.update_board(2,1, player_piece)
    elsif number == 9  
      self.update_board(2,2, player_piece)
    end
  end

  def is_winner?(piece, player)
    if self.value_via(1) == piece && self.value_via(2) == piece && self.value_via(3) == piece
      puts "#{player} wins!"
      true
    elsif self.value_via(4) == piece && self.value_via(5) == piece && self.value_via(6) == piece
      puts "#{player} wins!"
      true
    elsif self.value_via(7) == piece && self.value_via(8) == piece && self.value_via(9) == piece
      puts "#{player} wins!"
      true
    elsif self.value_via(1) == piece && self.value_via(4) == piece && self.value_via(7) == piece
      puts "#{player} wins!"
      true
    elsif self.value_via(2) == piece && self.value_via(5) == piece && self.value_via(8) == piece
      puts "#{player} wins!"
      true
    elsif self.value_via(3) == piece && self.value_via(6) == piece && self.value_via(9) == piece
      puts "#{player} wins!"
      true
    elsif self.value_via(1) == piece && self.value_via(5) == piece && self.value_via(9) == piece
      puts "#{player} wins!"
      true
    elsif self.value_via(7) == piece && self.value_via(5) == piece && self.value_via(3) == piece
      puts "#{player} wins!"
      true
    end
  end

  def is_tie?
    if self.value_via(1) != 1 &&
      self.value_via(2) != 2 &&
      self.value_via(3) != 3 &&
      self.value_via(4) != 4 &&
      self.value_via(5) != 5 &&
      self.value_via(6) != 6 &&
      self.value_via(7) != 7 &&
      self.value_via(8) != 8 &&
      self.value_via(9) != 9

      puts 'Tie Game!'
      true
    end
  end
end
