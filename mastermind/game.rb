require "./code_maker"
require "./code_breaker"

class Game
  attr_accessor :possible_colors, :user_role, :code_maker, :code_breaker

  def initialize
    @possible_colors = ["red", "blue", "green", "black", "white", "yellow", "pink", "orange"]
    @round = 0
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
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

  def run_game
    introduction
    determine_roles

    if @code_maker.is_player
      @code_maker.user_prompt("setting_code")
      @code_maker.user_set_code

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
      @code_maker.comp_set_code

      while @code_breaker.guess_count < 12 && !@code_maker.code_cracked?
        @code_breaker.user_prompt("guess_count")
        @code_breaker.user_prompt("guess_code_prompt")
        user_guess = gets.chomp.split(" ")
        @code_breaker.guess_code(user_guess)
        @code_maker.comp_review_code(user_guess)
        @code_maker.user_prompt("comp_review_perfect_guesses")
        @code_maker.user_prompt("comp_review_color_guesses")
      end

      if @code_maker.code_cracked?
        puts "\nNice One! You cracked the Computer's Code!"
      else
        puts "Sorry! Looks like the Machine's Code was too powerful!"
        puts "The Computer's Code was #{@code_maker.code}"
      end
    end
  end

end

game1 = Game.new
game1.run_game







