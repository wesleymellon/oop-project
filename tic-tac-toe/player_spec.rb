require "./player"

describe "Player" do 
  describe "#initialize" do 
    it "sets marker to equal 'X'" do 
      player = Player.new("X")
      expect(player.marker).to eq("X")
    end
  end
end