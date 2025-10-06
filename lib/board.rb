#lib/board.rb
require 'pry-byebug'
require_relative 'gameplay_module'
class Squares
  include GamePlay
  attr_accessor :id, :mark

    def initialize
      @mark = '  '
    end


    def mark_square(mark)
      @mark = mark
    end

end

class Board
  include GamePlay
  attr_accessor :squares, :columns, :back_diagonals, :forward_diagonals, :rows

    def initialize
      @squares = generate_squares
      @columns = make_columns(@squares)
      @back_diagonals = get_back_diagonals(@squares)
      @forward_diagonals = get_forward_diagonals(@squares)
      @rows = make_rows(@squares)
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

  def make_array(hash)
    array = []
    hash.each do |key, value|
      array << value
    end
    return array
  end
  
  def make_columns(squares)
    columns = {}
    col_num = 1
    x = 0
    y = 0
    column = []
    while x <= 6
      column << squares[[x, y]]
      y += 1
      if y > 6
        x += 1
        columns[col_num] = column
        column = []
        col_num += 1
        y = 0
      end      
    end
    return columns
  end

  def make_rows(squares)
    rows = []
    x = 0 
    y = 0
    row = []
    while y <= 6
      row << squares[[x, y]]
      x += 1
      if x > 6
        y += 1
        rows << row
        row = []
        x = 0
      end
    end
    return rows
  end

  def get_back_diagonals(squares)
    diagonals = []
    diag_num = 1
    x = 3
    y = 0
    while x <= 6
      diagonals << get_back_diagonals_helper(squares, x, y)
      x += 1
      diag_num += 1
    end
    x = 6
    y = 1
    while y <= 3
      diagonals << get_back_diagonals_helper(squares, x, y)
      y += 1
      diag_num += 1
    end
    return diagonals
  end

  def get_back_diagonals_helper(squares, x, y)
    diagonal = []
    while !squares[[x, y]].nil?
      diagonal << squares[[x, y]]
      x -= 1
      y += 1
    end
    return diagonal
  end

  def get_forward_diagonals(squares)
    diagonals = []
    diag_num = 1
    x = 0
    y = 3
    while y >= 0
      diagonals << get_forward_diagonals_helper(squares, x, y)
      y -= 1
      diag_num += 1
    end
    x = 1
    y = 0
    while x <= 3
      diagonals << get_forward_diagonals_helper(squares, x, y)
      x += 1
      diag_num += 1
    end
    return diagonals
  end

  def get_forward_diagonals_helper(squares, x, y)
    diagonal = []
    while !squares[[x, y]].nil?
      diagonal << squares[[x, y]]
      x += 1
      y += 1
    end
    return diagonal
  end
  

end
game = Board.new
binding.pry
puts 'end'
