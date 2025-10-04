#lib/board.rb
require 'pry-byebug'
class Squares
  attr_accessor :id, :mark

    def initialize
      @mark = ' '
    end


    def mark_square(mark)
      @mark = mark
    end

end

class Board
  attr_accessor :squares

    def initialize
      @squares = generate_squares
    end

  
  def generate_squares
    squares = {}
    x = 0
    y = 0
    until squares.length == 49 
      squares[[x, y]] = Squares.new
      x += 1
      y += 1 if x > 6
      x = 0 if x > 6
    end
    return squares
  end





end
