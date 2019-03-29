require "./board"
require "./player"

class Game
  attr_accessor :is_won, :is_player1_turn, :is_player2_turn

  def initialize(player1, player2)
    @is_won = false
    @is_player1_turn = true
    @is_player2_turn = false
    @player1 = player1
    @player2 = player2
  end

  def play

  end

  def add_piece(row, col, board)
    if is_player1_turn 
      board.grid[row][col] = "X"
    else
      board.grid[row][col] = "O"
    end
  end

  def valid_input?(input)
    valid = true
    # if input < 0 || input > 2
  end

  def game_over?(board)
    horz_win?(board) || vert_win?(board) || diag_win?(board)
  end

  def horz_win?(board)
    puts "horz win running"
    board.grid.each do |whole_row|
      if whole_row.all? do |e|
          e == "X"
        end
        @is_won = true
        break

      elsif whole_row.all? do |e|
        e == "O"
        end
        @is_won = true
        break
      end
    end

    @is_won
  end

  def vert_win?(board)
    puts "vert win running"
    board.grid.length.times do |i|
      if vert_helper(@player1.marker, i) || vert_helper(@player2.marker, i) 
        @is_won = true
        break
      
      # elsif board.grid.all? do |e|
      #     e[i] == "O"
      #   end
      #   @is_won = true
      #   break
      # end
    end

    @is_won
  end

  def diag_win?(board)
    # puts "diag win running"
    # if board.grid[0][0] == "X" && board.grid[1][1] == "X" && board.grid[2][2] == "X"
    #   @is_won = true
    # elsif board.grid[0][2] == "X" && board.grid[1][1] == "X" && board.grid[2][0] == "X"
    #   @is_won = true
    # end

    # if board.grid[0][0] == "O" && board.grid[1][1] == "O" && board.grid[2][2] == "O"
    #   @is_won = true
    # elsif board.grid[0][2] == "O" && board.grid[1][1] == "O" && board.grid[2][0] == "O"
    #   @is_won = true
    # end

    diag_helper(@player1.marker)
    diag_helper(@player2.marker)

    @is_won
  end

  def vert_helper(marker, i)
    board.grid.all? do |row|
      row[i] == marker
    end
  end

  def diag_helper(marker)
    # Check for marker
    if board.grid[0][0] == marker && board.grid[1][1] == marker && board.grid[2][2] == marker
      @is_won = true
    elsif board.grid[0][2] == marker && board.grid[1][1] == marker && board.grid[2][0] == marker
      @is_won = true
    end
  end

end

game1 = Game.new

board1 = Board.new
board1.display
puts game1.horz_win?(board1)

puts game1.vert_win?(board1)


player1 = Player.new("X")
player2 = Player.new("O")

game1.add_piece(0,0, board1)

board1.display