require "./comp_code_breaker_algorithm"

class CodeBreaker
  attr_accessor :is_player, :guess_count, :current_guess

  def initialize
    @is_player = false
    @guess_count = 0
    @current_guess = nil
    @possible_colors = ["red", "blue", "green", "black", "white", "yellow", "pink", "orange"]
    @game_bot = Comp_Code_Breaker_Algo.new
  end

  def user_prompt(subject)
    case subject
      when "guess_code_prompt"
        puts "\nWhat's your guess? Please choose four pieces and separate them with spaces\n"
        puts "red blue green yellow pink orange black white"
      when "guess_count"
        puts "\nGuess Number #{@guess_count}"
      else
        puts "This shouldn't run!"
    end
  end

  def guess_code(input_guess)
    if is_valid_guess?(input_guess)
      @guess_count += 1
      @current_guess = input_guess
    else
      puts "\nThat's not a valid guess! Please try again.\n\n"
      user_prompt("guess_code_prompt")
      input_guess = gets.chomp.split(" ")
      guess_code(input_guess)
    end
  end

  def is_valid_guess?(input_guess)
    right_length = input_guess.length == 4
    right_color = input_guess.all? do |color|
      @possible_colors.include?(color)
    end

    right_length && right_color
  end

  def comp_guess(perfect_guess, correct_color_guess)
    #code here for computer to be smart about its guess
    current_guess = @game_bot.construct_guess
    guess_code(current_guess)
  end

  def user_guess(current_guess)
    user_prompt("guess_code_prompt")
    current_guess = gets.chomp.split(" ")
    guess_code(current_guess)
  end
end