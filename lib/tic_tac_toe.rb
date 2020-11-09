class TicTacToe

    WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8], [0,3,6], [1,4,7],[2,5,8], [0,4,8], [2,4,6]]

    def initialize(board = nil) #default value of nil if board is empty 


        @board = board || Array.new(9," ") #Array.new creates an empty array 

    end 

    def display_board #prints arbitaray arrganments of the board

        #tip oif it says prints then it means puts
        #basically this method is a graphic representation of the board

        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------" 
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

    end 

    def input_to_index(user_input)

        #turn string into corresponding index of the @board. e.g. "4" would be equal to the index 3

        user_input.to_i-1 #using the .to_i method to change the stringhts into integers, then minus 1 to match the array count of the board

    end 

    def move(index, token = "X")

        #we are assigning value (with the token arugment) to the array based on the index on number 

        @board[index] = token

    end 

    def position_taken?(index)

        if @board[index] == "X" || @board[index] == "O"
            true  #soft return true
        else 
            false #soft return false
        end 
    end 

    def valid_move?(position)

        if @board[position] == "X" #if position/index is taken (i.e. X) return false
            false
        elsif position.between?(0,8) #otherwise it's true if the position is between the approproiate index numbers
            true 
        end 

    end 

    def turn_count

        count = 0 #create a counter to keep track of turns and be able to count & call later

        @board.each do |i| #iterate through the board array to look for valid turns
            count += 1 if i == "X" || i == "O" #icrement counter by 1
        end 

       count #call the counter

    end 

    def current_player

        # if turn_count last index is equal to x, then it's o's turn
        #otherwise it's x's turn 

        if turn_count.odd?
            "O"
        else 
            "X"
        end 

    end 

    def turn

        user_input = gets.chomp #method allows us us to get a users input to create variables in other words holding player input
        
        index = input_to_index(user_input) #checking to see if the user input is a valid move by calling method, if it is it calls the move method, and then displays the board
          if valid_move?(index)
            move(index, current_player) 
            display_board
          else
            puts "Try again, not a valid move [1-9]" 
            turn #calls turn method again 
          end

    end 

    def won?

        #if @board does not contain any of the winning combinations in my constant then return false 
        WIN_COMBINATIONS.detect do |combo| #iterate through the win constant w/ detect to check that all index positions are equal.
            #I.e. we're checking to see if al index positions are either Xs or Os
            @board[combo[0]] == @board[combo[1]] &&
            @board[combo[1]] == @board[combo[2]] && 
            position_taken?(combo[0])

        end 

    end 

    def full?

       @board.all?{|token| token == "X" || token == "O"}

    end 

    def draw?

        !won? && full?

    end 


    def over?

        won? || draw? #the game is over if someone either won or if there is a draw, call on these methods

    end 

    def winner

        if winning_combo = won? 
            @board[winning_combo.first]
        end 

    end 

    def play
        while !over? #bang method - while over is the opposite value - i.e. not over 
        turn #initiate the turn method
        end 
        if won? 
            puts "Congratulations #{winner}!" 
        elsif draw?
            puts "Cat's Game!"
        end 
    end 

end 