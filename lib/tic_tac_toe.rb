class TicTacToe

    WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5],  # Middle row
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
        # et cetera, creating a nested array for each win combination
      ]

    def initialize 
        @board = Array.new(9, " ")
    end


    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"

        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"

        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
        
    end

    def input_to_index(input)
        @index = input.to_i - 1
    end


    def move(index, token = "X")
        @board [index] = token
    end

    def position_taken?(index)
        if @board[index] == "X" ||  @board[index] == "O"
            return true

        else
             false
        end
    end

    def valid_move?(index)
        !position_taken?(index) && index.between?(0,8)
        
    end 

    def turn
        puts "Choose a number between 1-9"
        input = gets.chomp
        index = input_to_index(input)

        if valid_move?(index)
            move(index, current_player)
            display_board

        else 
            turn
        end
    end

    def turn_count
      
        @board.count{|token| token == "X" || token == "O" }
        
    end

    def current_player
        turn_count % 2 ==  0 ? "X" : "O"
    end

    def won?
        WIN_COMBINATIONS.detect do |combo|
           position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
        end
    end

    def full?
        WIN_COMBINATIONS.all? do |tokens|
          position_taken?(tokens[0])
        end
    end

    
  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    WIN_COMBINATIONS.detect do |winner|
      if position_taken?(winner[0]) && (@board[winner[0]] == "X") && (@board[winner[1]] == "X") && (@board[winner[2]] == "X")
        return "X"
      elsif position_taken?(winner[0]) && (@board[winner[0]] == "O") && (@board[winner[1]] == "O") && (@board[winner[2]] == "O")
        return "O"
      end
    end
  end

  def play
    until over? 
      turn
    end

    if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end