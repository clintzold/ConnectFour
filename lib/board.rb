#lib/board.rb

class Squares
  attr_accessor :id, :mark, :adj

    def initialize(id)
      @id = id
      @mark = '#'
      @adj = []
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
    squares = []
    x = 0
    y = 0
    until squares.length == 49 
      squares << Squares.new([x, y])
      x += 1
      y += 1 if x > 7
      x = 0 if x > 7
    end
    return squares
  end

  def get_square_by_id(id)
    @squares.each do |item|
      return item if item.id == id
    end
  end
end

