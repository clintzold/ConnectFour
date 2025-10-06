#lib/players.rb

require_relative 'gameplay_module'

class Player
  include GamePlay
  attr_accessor :name, :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end

    
  def choose_column
    print "#{self.name}, choose a column: "
    choice = gets.chomp.to_i
  end

end
