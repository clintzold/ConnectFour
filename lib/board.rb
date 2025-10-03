#lib/board.rb
require 'pry-byebug'
class Squares
  attr_accessor :id, :mark, :adj

    def initialize
      @mark = '#'
      @adj = []
    end


    def mark_square(mark)
      @mark = mark
    end

    def add_neighbour(node)
      @adj << node unless @adj.include?(node)
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

  def add_edge(node_one, node_two)
    node_one.add_neighbour(node_two)
    node_two.add_neighbour(node_one)
  end

  def build_adjacency_list
    @squares.each do |square_key, square_value|
      neighbours = find_neighbours(square_key)
      neighbours.each do |neighbour|
        if neighbour[0] <= 6 && neighbour[1] <= 6 && neighbour[0] >= 0 && neighbour[1] >= 0
          p neighbour
          add_edge(square_value, @squares[neighbour])
        end
      end
    end
  end

  def find_neighbours(square)
    x = square[0]
    y = square[1]
    neighbours = [
    [x + 1, y], [x - 1, y], [x + 1, y + 1], [x + 1, y - 1], [x - 1, y - 1], [x - 1, y + 1], [x, y + 1], [x, y - 1]]
  end

  def get_square_by_id(id)
    @squares.each do |key, value|
      return value if key == id
    end
  end

end
