module AskPlayer
    def ask_name
        puts "Hello, whats your name?"
        @name = gets.chomp
    end  
    
    def ask_piece(player)
        puts "#{player} would you like X or O?"
        piece = gets.chomp
        if piece == "X" || piece == "O"
            @piece = piece
        else 
            puts "NOT X OR O"
            ask_piece(player)
        end 
    end     

    def choose_number
        puts "Where would you like to go?"
        place = gets.chomp.to_i
        if place > 9 || place < 0 
            puts "INVALID SPOT"
            choose_number
        else 
            return place
        end 
    end     
end 

class Player
    include AskPlayer
    
    attr_accessor :name, :piece

    def initialize(name, piece)
        @name = name
        @piece = piece
    end 
end 

class Board
    attr_accessor :board

    def showboard
        @board
    end 

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
            print "| "
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
 
    def play_game(number, board, player_piece)
        if board.position_empty?(number) 
            board.place_piece(number, player_piece)   
        else 
            puts "INVALID PLACEMENT, INPUT AGAIN"
            new_number = gets.chomp.to_i
            play_game(new_number, board, player_piece)
        end 
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

    def position_empty?(number)
        if self.value_via(number) != 'X' && self.value_via(number) != 'O'
            return true
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
                puts "Tie Game!"
                true
        end
    end  
    
end 

player_one = Player.new("","")
player_two = Player.new("","")
player_one.ask_name
player_two.ask_name
player_one.ask_piece(player_one.name)
player_two.ask_piece(player_two.name)

board = Board.new
board.array_values
board.drawboard

loop do 
    if player_two.piece == player_one.piece
        puts "Sorry, that symbol is unavailable"
        player_two.ask_piece(player_two.name)
    else 
        break
    end 
end 

loop do
    board.play_game(player_one.choose_number, board, player_one.piece)
    if board.is_winner?(player_one.piece, player_one.name)
        break
    elsif board.is_tie?
        break
    end 
    board.play_game(player_two.choose_number, board, player_two.piece)
    if board.is_winner?(player_one.piece, player_one.name)
        break
    elsif board.is_tie?
        break
    end 
end 