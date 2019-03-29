require "./board"

describe "Board" do
  describe "#initialize" do
    it "sets grid to be a 3x3" do
      board = Board.new
      expect(board.grid.length).to eq(3)
      expect(board.grid[0].length).to eq(3)
    end
  end
end