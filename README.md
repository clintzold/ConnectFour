CONNECT FOUR

My version of the classic game, written in Ruby.

Originally, I thought this game would be the same as Tic-Tac-Toe. There was
one small difference however.

The Challenge

In Tic-Tac-Toe, a win is determined by an edge-to-edge matchup of squares. You
simply put the squares into an array, iterate through and compare every item to 
see if they all match. Repeat this for the rather limited combination of possible
wins and the board is fully checked.

In Connect Four, the winning possibilities are multiplied many times over. Since
a win is not determined by an edge-to-edge match of squares, you cannot simply
scan an entire slice of rows, columns or diagonals and see if they all match.

Likewise, finding four or more of the same markers in a given array, does not 
mean they are all adjacent to one another.

My Solution

Pseudocode
    - Check rows/columns/diagonals with a queue and a collector array.

      While queue is not empty
        First item from queue(row/column etc...) is shifted and added to the collector

        Next item is shifted and compared to last item in collector
            if collector item and queue item match
                queue item is added to collector
            if no match
                collector is emptied
                queue item added to collector
      Begin again

      If collector reaches a length of 4, returns true

Ruby Implementation
    
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

I also wrote much of this program using TDD. I found it very cumbersome but definitely helped with
keeping things organized and giving me confidence to move on, once a method had been thoroughly
tested. 

I will continue to master this skill until I can skilfully choose when to use it, and when not to.
