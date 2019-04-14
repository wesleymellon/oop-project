class Comp_Code_Breaker_Algo
  attr_accessor :constructed_guess

  def initialize
    @possible_colors = ["red", "blue", "green", "black", "white", "yellow", "pink", "orange"]
    @red_count = 0
    @blue_count = 0
    @green_count = 0
    @yellow_count = 0
    @orange_count = 0
    @pink_count = 0
    @white_count = 0
    @black_count = 0
    @constructed_guess = []
    @active_guess = []
    @correct_perfect = 0
    @correct_color = 0
  end

  def construct_guess
    @constructed_guess = []
    4.times do 
      @constructed_guess.push(@possible_colors.sample)
    end

    @constructed_guess
  end
end