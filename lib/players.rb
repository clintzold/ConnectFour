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
    verify_column(choice)
  end

  def verify_column(input)
    return input if input.is_a?(Integer) && input > 0 && input <= 7
    puts "Invalid choice!"
    choose_column
  end

end
