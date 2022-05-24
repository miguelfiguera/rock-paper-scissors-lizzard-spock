require_relative "game.rb"
require_relative "text_module.rb"
require "pry"
def game
game = Game.new
game.game_prep
game.turns
game.reset
go_again
end

def go_again
    puts "Do you want to play again? Y/N"
    answer= gets.chomp.downcase
    if answer== "y"
        game
    else
        puts "Thanks for playing"
    end
end

game