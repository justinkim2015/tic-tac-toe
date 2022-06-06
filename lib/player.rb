class Player
  attr_accessor :name, :piece

  def initialize
    @name = ask_name
    @piece = ask_piece(@name)
  end

  def ask_name
    puts 'Hello, whats your name?'
    @name = gets.chomp
  end

  def ask_piece(player)
    puts "#{player} would you like X or O?"
    piece = gets.chomp
    if piece == "X" || piece == "O"
      @piece = piece
    else
      puts 'NOT X OR O'
      ask_piece(player)
    end
  end

  def choose_number
    puts 'Where would you like to go?'
    place = gets.chomp.to_i
    if !place.between?(1, 9)
      puts 'INVALID SPOT'
      choose_number
    else
      place
    end
  end
end
