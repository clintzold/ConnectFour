#lib/players.rb

class Player
  attr_accessor id:, marker:, won:

    def initialize(id, marker)
      @id = id
      @marker = marker
      @won = false
    end
end
