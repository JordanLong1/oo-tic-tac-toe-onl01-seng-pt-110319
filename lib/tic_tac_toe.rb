require 'pry'
class TicTacToe

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ]

    def display_board
    #     puts " #{@board[0]} | #{@board[1]} |#{@board[2]} "
    #     puts "-----------"
    #     puts " #{@board[3]} | #{@board[4]} |#{@board[5]} "
    #     puts "-----------"
    #     puts " #{@board[6]} | #{@board[7]} |#{@board[8]} "
    #     puts "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

        def input_to_index(user_input)
            user_input.to_i - 1
        end

        def move(index, player)
            @board[index] = player
        end

        def position_taken?(position)
            if @board[position] == " "
                # binding.pry
                return false
            else
                return true
            end
        end

        def valid_move?(position)
            # binding.pry
            if position.between?(0,8) && !position_taken?(position)
                return true
            else
                return false
            end
        end

        def turn_count
            counter = 0
            @board.each do |index|  
              if index == "O" || index == "X"
                counter += 1
               end
            end
             counter
        end

        def current_player
           turn_count
           if turn_count.even?
            return "X"
           else
            return "O"
           end 
        end

            def turn
            puts "Please enter a position 1-9"
            new_input = gets.strip
            input = input_to_index(new_input)
            if valid_move?(input)
                move(input, current_player)
                display_board
            else
                puts "Invalid input. Please try again."
                turn
            end
        end

        def won?
            WIN_COMBINATIONS.each do |win_combos|
                if @board[win_combos[0]] == "X" && @board[win_combos[1]] == "X" && @board[win_combos[2]] == "X"
                    return win_combos
                elsif @board[win_combos[0]] == "O" && @board[win_combos[1]] == "O" && @board[win_combos[2]] == "O"
                    return win_combos
                end
            end
            return false
        end
            
        def full?

           if @board.all? { |slot| slot == "X" || slot == "O" }
            true
        else
             false 
            end
        end

        def draw?
            full? && !won?
        end

        def over?
            draw? || won?
        end

        def winner
            WIN_COMBINATIONS.each do |win_combos|
                if @board[win_combos[0]] == "X" && @board[win_combos[1]] == "X" && @board[win_combos[2]] == "X"
                    return "X"
                elsif @board[win_combos[0]] == "O" && @board[win_combos[1]] == "O" && @board[win_combos[2]] == "O"
                    return "O"
                end
            end
            return nil
        end
            
        def play
            while over? == false 
                turn
            end
            if won?
                puts "Congratulations #{winner}!"
            elsif draw?
                puts "Cat's Game!"
                
            end
        end

            
             


end