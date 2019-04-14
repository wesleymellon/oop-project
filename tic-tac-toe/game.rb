require "./board"
require "./player"

class Game
  attr_accessor :is_won, :is_player1_turn, :is_player2_turn, :board

  def initialize(player1, player2, board)
    @is_won = false
    @is_player1_turn = true
    @is_player2_turn = false
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def play
    puts "Welcome to Tic Tac Toe! \nTo Win, get Three in a Row!" 
    until game_over?
      puts "\n"
      puts "Its your turn, #{is_player1_turn ? 'Player 1':'Player 2'}!!"
      puts "Please put what row you want to place your piece."
      row = gets.chomp.to_i
      puts "Please put what column you want to place your piece."
      col = gets.chomp.to_i

      unless valid_input?(row, col)
        puts "That's not a valid input! Please try again."
        next
      end

      add_piece_to_board(row, col)
      puts "Nice Play!\n\n"
      puts "-----------"
      @board.display


      swap_player_turns

    end

    if horz_win? || vert_win? || diag_win?
      puts "Congrats #{is_player2_turn ? 'Player 1':'Player 2'}, You Won Through Cunning and Wit!"
    else
      puts "The Game is a Tie!"
    end
  end

  def valid_input?(row, col)
    valid = true
    if ((!row.is_a? Numeric) || (!col.is_a? Numeric))
      valid = false
      puts "not a number!"
    elsif row < 0 || 2 < row 
      valid = false
      puts "row not between 0 and 2"
    elsif col < 0 || 2 < col
      valid = false
      puts "col not between 0 and 2"
    elsif @board.grid[row][col] != "-"
      valid = false
      puts "position already filled"
    end

    valid
  end

  def add_piece_to_board(row, col)
    if @is_player1_turn
      @board.change_piece(row, col, @player1.marker)
    else
      @board.change_piece(row, col, @player2.marker)
    end

  end

  def swap_player_turns
    if @is_player1_turn
      @is_player1_turn = false
      @is_player2_turn = true
    else
      @is_player1_turn = true
      @is_player2_turn = false
    end
  end

  def game_over?
    horz_win? || vert_win? || diag_win? || tie?
  end

  def horz_win?
    @board.grid.each do |row|
      if horz_win_helper(@player1.marker, row) || horz_win_helper(@player2.marker, row)
        @is_won = true
        break
      end
    end

    @is_won
  end

  def horz_win_helper(marker, row)
    row.all? do |e|
      e == marker
    end
  end

  def vert_win?
    @board.grid.length.times do |i|
      if vert_win_helper(@player1.marker, i) || vert_win_helper(@player2.marker, i) 
        @is_won = true
        break
      end
    end

    @is_won
  end

  def vert_win_helper(marker, i)
    @board.grid.all? do |row|
      row[i] == marker
    end
  end

  def diag_win?
    diag_win_helper(@player1.marker)
    diag_win_helper(@player2.marker)

    @is_won
  end

  def diag_win_helper(marker)
    if @board.grid[0][0] == marker && @board.grid[1][1] == marker && @board.grid[2][2] == marker
      @is_won = true
    elsif @board.grid[0][2] == marker && @board.grid[1][1] == marker && @board.grid[2][0] == marker
      @is_won = true
    end
  end

  def tie?
    @board.check_board_full
  end

end


player1 = Player.new("X")
player2 = Player.new("O")
board1 = Board.new

game1 = Game.new(player1, player2, board1)
game1.board.display
game1.play