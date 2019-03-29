class Board
  attr_accessor :grid, :is_board_full

  def initialize
    @grid = [['-', '-', '-'], ['-', '-', '-'], ['-', '-', '-']]
    @is_board_full = false
  end

  def display
    puts "BOARD STATE"
    # puts "-----------\n"

    # rows = []
    # @grid.each do |row|
    #   rows << row.join(" | ")
    # end
    # puts rows.join("\n----------\n")
    # puts "\n"
    puts "-----------"
    puts
    puts "#{@grid[0][0]} | #{@grid[0][1]} | #{@grid[0][2]}"
    puts "-----------"
    puts "#{@grid[1][0]} | #{@grid[1][1]} | #{@grid[1][2]}"
    puts "-----------"
    puts "#{@grid[2][0]} | #{@grid[2][1]} | #{@grid[2][2]}"
    puts
  end

  def change_piece(row, col, marker)
    @grid[row][col] = marker
  end

  def check_board_full
    unless @grid.any? do |row|
        row.any? do |e|
          e == "-"
        end
      end
      @is_board_full = true
    end

    @is_board_full
  end

end