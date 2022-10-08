require 'pry'
class TicTacToe

    WIN_COMBINATIONS = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    def initialize()
        # @board = ["X", "X", "X", " ", "O", " ", "O", " ", " "]
        # @board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end


    def display_board

        puts '" ' + @board[0] + ' | ' + @board[1] + ' | ' + @board[2] + ' "'
        puts '"-----------"'
        puts '" ' + @board[3] + ' | ' + @board[4] + ' | ' + @board[5] + ' "'
        puts '"-----------"'
        puts '" ' + @board[6] + ' | ' + @board[7] + ' | ' + @board[8] + ' "'

    end

    def input_to_index(input)
        input.to_i - 1
    end

    def move(index, move = "X")
        @board[0] = "X"
        @board[index] = move
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O" ? true : false
    end

    def valid_move?(index)
        !position_taken?(index) && index >= 0 && index < @board.length ? true : false
    end

    def turn_count
        @board.length - @board.count(" ")
    end

    def current_player
        turn_count.odd? ? "O" : "X"
    end

    def turn
        puts "What is your move? Please enter a value between 1 and 9..."
        position = gets
        if position.to_i.between?(1, 9)
            index = input_to_index(position)
            if valid_move?(index)
                if current_player == "O"
                    move(index, "O")
                else
                    move(index)  
                end      
                display_board
            else
                puts "Try again, as inputted position is already taken"
                turn     
            end
        else
            puts "Invalid move. Please enter a value between 1 and 9..."
            turn
        end

    end

    def won? 
        player = " "
        current_player == "X" ? player = "O" : player = "X"

        winner = false
        winning_combo = []

        WIN_COMBINATIONS.each do |combo|
            if @board[combo[0]] == player && @board[combo[1]] == player && @board[combo[2]] == player
                winner = true
                winning_combo = combo
            end
        end

        if winner 
            winning_combo 
        else
            false 
        end     

    end

    def full? 
        @board.length - @board.count(" ") == @board.length ? true : false
    end

    def draw? 
        if won?    
            false
        elsif full?
            true
        else
            false    
        end
    end

    def over? 
        won? || draw? ? true : false
    end

    def winner 
        if won?
            if current_player == "X"
                return "O"
            else 
                return "X"    
            end    
        end
    end

    def play 
        while !over?
            turn
        end

        if won?
            puts ("Congratulations #{winner}!")
        else 
            puts ("Cat's Game!")
        end
    end

end

