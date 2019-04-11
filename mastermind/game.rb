require "./code_maker"
require "./code_breaker"

class Game
  attr_accessor :possible_colors, :user_role, :code_maker, :code_breaker

  def initialize
    @possible_colors = ["red", "blue", "green", "black", "white", "yellow", "pink", "orange"]
    @round = 0
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
    @current_perfect_matches = 0
    @current_color_matches = 0
    @code_cracked = false
  end

  def introduction
    puts "Welcome to Mastermind!! Test your skills against the computer in this game of wits!\n \n"
  end

  def determine_roles
    puts "Enter 'maker' if you'd like to be the Code Maker this session, or enter 'breaker' if you'd like to be the Code Breaker instead!"
    choice_user = gets.chomp
    if is_valid_role?(choice_user)
      if choice_user == "maker"
        @user_role = "maker"
        @code_maker.is_player = true
      else
        @user_role = "breaker"
        @code_breaker.is_player = true
      end

    else
      puts "That's not a valid role!"
      determine_roles
    end

  end

  def is_valid_role?(input)
    input == "maker" || input == "breaker"
  end

  def check_guess
    find_perfect_matches(@code_maker.code, @code_breaker.current_guess)
    find_color_matches(@code_maker.code, @code_breaker.current_guess)
    # @current_color_matches
  end

  def find_perfect_matches(code, guess)
    @current_perfect_matches = 0
    guess.each_with_index do |color, i|
      if color == code[i]
        @current_perfect_matches += 1
      end
    end
  end

  def find_color_matches(code, guess)
    sudo_count = 0
    dummy_code = @code_maker.code
    guess.each do |color|
      if code.include?(color)
        code.delete_at(code.index(color))
        sudo_count += 1
      end
    end

    @current_color_matches = sudo_count - @current_perfect_matches
  end

  def run_game
    introduction
    determine_roles

    if @code_maker.is_player
      perfect_guess_number, color_guess_number = 0
      @code_maker.user_prompt("setting_code")
      @code_maker.set_code

      while @code_breaker.guess_count < 12 && !@code_maker.code_cracked?
        computer_guess = @code_breaker.comp_guess(@code_maker.perfect_guess_number, @code_maker.color_guess_number)
        code_maker.user_prompt("review_intro")
        puts computer_guess.join(" ")
        @code_maker.perfect_guess_number, @code_maker.color_guess_number = @code_maker.user_review_code
      end

      if @code_maker.code_cracked?
        puts "Looks like the Machine cracked your code this time!"
      else
        puts "Looks like the Machine couldn't figure your code out!"
      end

    else
      puts "We got a breaker in the house!"
      #breaker code here
    end
  end

end

game1 = Game.new
game1.run_game