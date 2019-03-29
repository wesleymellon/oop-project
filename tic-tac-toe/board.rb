class Board
  attr_accessor :grid

  def initialize
    @grid = [['A', 'O', 'C'], ['D', 'O', 'F'], ['G', 'O', 'I']]
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

end