require 'pry'

class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [8,4,0],
    [6,4,2]       ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(string)
    string.to_i-1
  end

  def move(indx, token)
    @board[indx] = token
  end

  def position_taken?(indx)
    if @board[indx] == " "
      false
    else true
    end
  end

  def valid_move?(indx)
    if indx.between?(0,8) && position_taken?(indx) == false
      true
    else false
    end
  end

  def turn
    puts "Enter a number between 1-9."
    input = gets.chomp
    indx = input_to_index(input)
    if valid_move?(indx)
      token = current_player
      move(indx, token)
      display_board
    else turn
    end
  end

  def turn_count
    count = 0
    @board.each do |box|
      if box != " "
        count += 1
      end
    end
    count
  end

  def current_player
    num = turn_count
    if num % 2 == 0
      "X"
    else "O"
    end
  end

#  [0,1,2],
#  [3,4,5],
#  [6,7,8],
#  [0,3,6],
#  [1,4,7],
#  [2,5,8],
#  [8,4,0],
#  [6,4,2]


  def won?
    WIN_COMBINATIONS.each do |combo|
      if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
       return combo
    elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
       return combo
     end
   end
   false
  end

  def full?
    @board.all? do |box|
      box != " "
    end
  end

  def draw?
    if !won? && full?
      true
    else false
    end
  end

  def over?
    if won? || draw?
      true
    else false
    end
  end

  def winner
    if won?
      @board[won?[0]]
    else nil
    end
  end

  def play
    until over?
      turn
    end
      if won?
        puts "Congratulations #{winner}!"
      else draw?
        puts "Cat's Game!"
  end
end



end
