#lib/board.rb
require 'pry-byebug'
class Squares
  attr_accessor :id, :mark

    def initialize
      @mark = '  '
    end


    def mark_square(mark)
      @mark = mark
    end

end

class Board
  attr_accessor :squares, :columns

    def initialize
      @squares = generate_squares
      @columns = make_columns(@squares)
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
    rows = {}
    row_num = 1
    x = 0 
    y = 0
    row = []
    while y <= 6
      row << squares[[x, y]]
      x += 1
      if x > 6
        y += 1
        rows[row_num] = row
        row = []
        row_num += 1
        x = 0
      end
    end
    return rows
  end

  def get_back_diagonals(squares)
    diagonals = {}
    diag_num = 1
    x = 3
    y = 0
    while x <= 6
      diagonals[diag_num] = get_back_diagonals_helper(squares, x, y)
      x += 1
      diag_num += 1
    end
    x = 6
    y = 1
    while y <= 3
      diagonals[diag_num] = get_back_diagonals_helper(squares, x, y)
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
    diagonals = {}
    diag_num = 1
    x = 0
    y = 3
    while y >= 0
      diagonals[diag_num] = get_forward_diagonals_helper(squares, x, y)
      y -= 1
      diag_num += 1
    end
    x = 1
    y = 0
    while x <= 3
      diagonals[diag_num] = get_forward_diagonals_helper(squares, x, y)
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
  
  def create_mark_array(array)
    mark_array = []
    array.each { |item| mark_array << item.mark }
    return mark_array
  end

  def four_kind?(object_array)
    array = create_mark_array(object_array)
    matches = [array.shift] #Add first object to compare
    while !array.empty?
      curr = array.shift
      last = matches.last
      if curr == last
        matches << curr
      else
        matches = [curr]
      end
      return true if matches.length == 4 && matches.first != '  '
    end
    return false
  end


end
