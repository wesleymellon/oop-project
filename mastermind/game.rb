require "./code_maker"
require "./code_breaker"

class Game
  attr_accessor :colors, :user_role

  def initialize
    @colors = ["red", "blue", "green", "black", "white", "yellow", "pink", "orange"]
    @round = 0
    @player_user = nil
    @player_comp = nil
    @user_role = nil
  end

  def introduction
    puts "Welcome to Mastermind!! Test your skills against the computer in this game of wits!\n \n"
  end

  def determine_roles
    puts "Enter 'maker' if you'd like to be the Code Maker this session, or enter 'breaker' if you'd like to be the Code Breaker instead!"
    choice_user = gets.chomp
    if is_valid_role(choice_user)
      if choice_user == "maker"
        @user_role = "maker"
      else
        @user_role = "breaker"
      end

    else
      puts "That's not a valid role!"
      determine_roles
    end

  end

  def is_valid_role(input)
    input == "maker" || input == "breaker"
  end

end

game1 = Game.new
game1.introduction
game1.determine_roles
puts game1.user_role