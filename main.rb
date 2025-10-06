require 'pry-byebug'
require_relative 'lib/board'
require_relative 'lib/gameplay_module'
require_relative 'lib/players'

game = Board.new
player_one = Player.new('Player One', "\u26aa")
player_two = Player.new('Player Two', "\u26ab")

binding.pry
puts 'end'
