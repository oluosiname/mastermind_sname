module SnameLogics
  class Logics
    def self.is_valid_level?(level)
      @level = level
      if @level == "a" || @level == "i" || @level == "b" 
        return true
      else
        return false
      end
    end

    def self.check_guess_length?(guess,level)
      result = case
        when level == "b" && guess.length > 4 then return "guess is too long"
        when level == "i" && guess.length > 6 then return "guess is too long"
        when level == "a" && guess.length > 8 then return "guess is too long"     
      end
      return "guess is too short" 
    end

    def self.is_input_command?(guess)
      return true if guess == "cheat" || guess == "exit" || guess == "h" || guess == "c" || guess == "q"
      return true if guess == "quit" 
      return false
    end

    def self.check_guess?(guess,level)
      return true if guess.length == 4 && level == "b"
      return true if guess.length == 6 && level == "i"
      return true if guess.length == 8 && level == "a"
      return false
    end

    def self.get_no_correct_elements
      no_of_elements = 0
      for i in (0...@user_guess.length) do
        no_of_elements += 1 if @user_guess.split("").sort[i] == @colour_code.sort[i]
      end
      no_of_elements
    end

    def self.get_no_correct_positions
      correct_positions = 0
      for i in (0... @user_guess.length) do
        correct_positions += 1 if  @user_guess[i] == @colour_code[i]
      end 
      correct_positions
    end
    
    def self.get_feedback(user_guess,colour_code)
      @user_guess = user_guess
      @colour_code = colour_code
      feedback = "#{@user_guess} has #{get_no_correct_elements} of the correct elements with #{get_no_correct_positions} in the correct positions"
      feedback
    end
  end
end
