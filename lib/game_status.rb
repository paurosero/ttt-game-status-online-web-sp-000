require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]
def won?(board)
 WIN_COMBINATIONS.each do |element|
   result = []
   element.select{|position| result << board[position]}
   if result == ["X", "X", "X"] || result == ["O","O","O"]
    return element
    end
   end
  return false
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
 !won?(board) && full?(board)
end

def over?(board)
 draw?(board) || won?(board) || full?(board)
end

def winner(board)
  if won?(board)
    won?(board[0]).first
  end
end
