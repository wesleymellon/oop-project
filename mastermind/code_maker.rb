class CodeMaker
  attr_accessor :is_player, :code, :computer_guess, :correct_guess, :correct_color_guess, :perfect_guess_number, :color_guess_number

  def initialize
    @is_player = false
    @code = nil
    @possible_colors = ["red", "blue", "green", "black", "white", "yellow", "pink", "orange"]
  end

  def user_prompt(subject)
    case subject
      when "setting_code"
        puts "\nWhat would you like the code to be? Please choose four pieces and separate them with spaces"
        puts "red blue green yellow pink orange black white \n"
      when "review_intro"
        puts "Please review the Computer's guess!"
        puts "The Computer's guess is as follows \n"
      when "review_perfect_guesses"
        puts "\nHow many guesses were exactly right?"
      when "review_color_guesses"
        puts "\nHow many guesses were the correct color, but not the right position?"

      else
        puts "This shouldn't run!"
    end
  end

  def set_code
    input_code = gets.chomp
    if is_valid_code?(input_code)
      @code = input_code.split(" ")
    else
      puts "\nThat's not a valid code!\n"
      user_prompt("setting_code")
      set_code
    end

  end

  def is_valid_code?(input_code)
    right_length = input_code.split(" ").length == 4
    right_colors = input_code.split(" ").all? do |color|
      @possible_colors.include?(color)
    end

    right_length && right_colors
  end

  def is_valid_review?(input)
    input = input.to_i
    (input.is_a? Numeric) && 0 <= input && input <= 4
  end

  def user_review_code
    user_prompt("review_perfect_guesses")
    @correct_perfect_guess = gets.chomp.to_i
    user_prompt("review_color_guesses")
    @correct_color_guess = gets.chomp.to_i
    unless is_valid_review?(@correct_perfect_guess)
      puts "That's not a valid review!"
      user_review_code
    end

    [@correct_perfect_guess, @correct_color_guess]
  end

  def comp_review_code

  end

  def code_cracked?
    @correct_perfect_guess == 4
  end
end