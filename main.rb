module AskPlayer
    def ask_name
        puts "Hello, whats your name?"
        @name = gets.chomp
    end  
    
    def ask_piece(player)
        puts "#{player} would you like X or O?"
        @piece = gets.chomp
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
            print '| '
            row.each do |value|
                print "#{value} | "
            end 
            puts "\n------------"
        end 
    end 
    
    def update_board(index_one, index_two, new_number)
        @board[index_one][index_two] = new_number
        drawboard
    end 
end 

board = Board.new
# board.array_values
board.drawboard
# board.update_board(1,1,'x')

player_one = Player.new('','')
player_two = Player.new('','')
player_one.ask_name
player_two.ask_name
player_one.ask_piece(player_one.name)
player_two.ask_piece(player_two.name)


def place_piece(number, board, player)
    if number == 1
        board.update_board(0,0, player.piece)    
    elsif number == 2
        board.update_board(0,1, player.piece)
    elsif number == 3
        board.update_board(0,2, player.piece)
    elsif number == 4
        board.update_board(1,0, player.piece)
    elsif number == 5
        board.update_board(1,1, player.piece)
    elsif number == 6
        board.update_board(1,2, player.piece)
    elsif number == 7
        board.update_board(2,0, player.piece)
    elsif number == 8
        board.update_board(2,1, player.piece)
    else
        board.update_board(2,2, player.piece)
    end 
end 

place_piece(player_one.choose_number, board, player_one)

def play_game(number, board, player)
    place_piece(number, board, player)
end 

2.times do
    play_game(player_one.choose_number, board, player_one)
    play_game(player_two.choose_number, board, player_two)
end 
