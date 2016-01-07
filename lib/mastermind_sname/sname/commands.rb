require_relative "game.rb"
module MastermindSname
  class Commands
    def self.command_action(to_do, colours)
      exit if to_do == "quit" || to_do == "q"
      cheat_mode(colours) if to_do == "cheat" || to_do == "c"
    end

    def self.cheat_mode(game_colours)
      "The sequence is #{game_colours.join}"
    end
  end
end
