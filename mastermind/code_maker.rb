class CodeMaker
  attr_accessor :is_player, :code, :computer_guess, :perfect_guess_number, :color_guess_number

  def initialize
    @is_player = false
    @code = nil
    @possible_colors = ["red", "blue", "green", "black", "white", "yellow", "pink", "orange"]
    @perfect_guess_number = 0
    @color_guess_number = 0
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

  def user_set_code
    input_code = gets.chomp
    if is_valid_code?(input_code)
      @code = input_code.split(" ")
    else
      puts "\nThat's not a valid code!\n"
      user_prompt("setting_code")
      user_set_code
    end
  end

  def comp_set_code
    @code = []
    4.times do 
      @code.push(@possible_colors.sample)
    end
    #DELETE THIS LATER
    @code = ["black", "blue", "pink", "black"]
    @code
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
    @color_guess_number = gets.chomp.to_i
    unless is_valid_review?(@correct_perfect_guess)
      puts "That's not a valid review!"
      user_review_code
    end

    [@correct_perfect_guess, @color_guess_number]
  end

  def comp_review_code(user_guess)
    user_guess.each do |guess|

    end

  end

  # Integrate Code

  def comp_find_perfect_matches(guess)
    @perfect_guess_number = 0
    guess.each_with_index do |color, i|
      if color == code[i]
        @perfect_guess_number += 1
      end
    end
  end

  def comp_find_color_matches(code, guess)
    sudo_count = 0
    dummy_code = @code_maker.code
    guess.each do |color|
      if code.include?(color)
        code.delete_at(code.index(color))
        sudo_count += 1
      end
    end

    @color_guess_number = sudo_count - @perfect_guess_number
  end

  #New Code Below

  def comp_review_code(user_guess)
    @perfect_guess_number = 0
    @color_guess_number = 0
    temp_code = @code
    # print @code
    # puts
    user_guess.each_with_index do |guess, i|
      # puts "i = #{i}"
      # puts "guess = #{guess}"
      # puts "@code[i] = #{@code[i]}"
      # puts "guess == @code[i] = #{guess == @code[i]}"
      if guess == @code[i]
        @perfect_guess_number += 1
        # temp_code.delete_at(i)
        # user_guess.delete_at(i)
      end
      # print temp_code
      # puts
    end

    # puts "@perfect_guess_number = #{@perfect_guess_number}"

    user_guess.each_with_index do |guess, i|
      # puts "guess == temp_code[i] #{guess == temp_code[i]}"
      if temp_code.include?(guess) && guess != temp_code[i]
        # temp_code.delete_at(temp_code.index(guess))
        @color_guess_number += 1
      end
    end

    # puts "@color_guess_number = #{@color_guess_number}"

  end

  # Integrate Code

  def code_cracked?
    @correct_perfect_guess == 4
  end
end