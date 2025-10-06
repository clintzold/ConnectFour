#lib/gameplay_module.rb

module GamePlay

  def print_intro_screen
    puts "Welcome to Connect Four!\n\n"
  end

  def draw_board(board)
    col = board.columns
    num = 1
    row = 6
    7.times do
      while num <= 7
        if num == 7
          print "|#{col[num][row].mark}|"
        else
          print "|#{col[num][row].mark}"
        end
        num += 1
      end
      puts "\n"
      if row == 0
        22.times do
          print "\u203e"
        end
        puts "\nPlayer One: \u26aa  Player Two: \u26ab"
      end
      row -= 1
      num = 1
    end
  end

  def mark_square(column, player)
    column.each do |square|
      if square.mark == '  '
        square.mark = player.marker
        return
      end
    end
      puts "Column is full!"
      choose_column(player)
  end

  #Extracts 'mark' values from array of objects(prevents data loss during #four_kind? operation
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

  def check_selection(selection)
    selection.each do |array|
      result = four_kind?(array)
      if result != false
        mark = array.first
        winner(mark)
      end
    end
    return false
  end

  def winner(mark)
    puts "Player One wins!" if mark == 'X'
    puts "Player Two wins!" if mark == 'O'
    return true
  end
end
