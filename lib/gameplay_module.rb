#lib/gameplay_module.rb

module GamePlay

  def print_intro_screen
    puts "Welcome to Connect Four!\n\n"
  end

  def play_game
    game = Board.new
    players = [Player.new('Player One', "\u26aa"), Player.new('Player Two', "\u26ab")]
    print_intro_screen
    loop do
      draw_board(game) 
      choice = players[0].choose_column
      mark_square(game.columns[choice], players[0])
      break if check_board(game) || tie?(game)
      players.rotate!
    end
    draw_board(game)
    winner(players[0])
    if play_again?
      game = nil
      players.each{ |player| player = nil }
      play_game
    end
  end

  def play_again?
    puts "\n[P] - Play again"
    puts "[Q] - Quit"
    answer = gets.chomp.upcase
    verify_play_again(answer)
    return false if answer == 'Q'
    return true if answer == 'P'
  end

  def verify_play_again(input)
    return if input == 'P' || input == 'Q'
    puts "Invalid choice!"
    play_again?
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

  def check_board(game)
    collection = [game.rows, game.make_array(game.columns), game.back_diagonals, game.forward_diagonals]
    while !collection.empty?
      group_to_check = collection.shift
      return true if check_selection(group_to_check)
    end
  end

  def tie?(game)
    game.squares.all?{ |key, square| square.mark != '  ' }
  end

  def mark_square(column, player)
    column.each do |square|
      if square.mark == '  '
        square.mark = player.marker
        return
      end
    end
      puts "Column is full!"
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
        return true
      end
    end
    return false
  end

  def winner(player)
    puts "#{player.name} wins!"  
  end
end
