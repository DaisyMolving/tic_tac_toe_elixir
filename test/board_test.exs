defmodule TicTacToeTest.Board do
  use ExUnit.Case

  test "a board has 9 spaces" do
    assert Enum.count(TicTacToe.Board.create_new_board) == 9
  end

  test "a new board is empty" do
    assert Enum.all?(TicTacToe.Board.create_new_board, fn(space) ->
      String.to_integer(space)
    end) == true
  end
  
  test "recognises a row" do
    assert TicTacToe.Board.rows(TicTacToe.Board.create_new_board) == [["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"]]
  end

  test "recognises a column" do
    assert TicTacToe.Board.columns(TicTacToe.Board.create_new_board) == [["1", "4", "7"], ["2", "5", "8"], ["3", "6", "9"]]
  end

  test "recognises a diagonal" do
    assert TicTacToe.Board.diagonals(TicTacToe.Board.create_new_board) == [["1", "5", "9"], ["3", "5", "7"]]
  end

  test "a row of all the same is recognised as a win?" do
    assert TicTacToe.Board.win?(["x", "x", "x", 
       "4", "5", "6", 
       "7", "8", "9"]) == true
    assert TicTacToe.Board.win?(["x", "o", "x", 
       "4", "5", "6", 
       "7", "8", "9"]) == false
  end

  test "a column of all the same is recognised as a win?" do
    assert TicTacToe.Board.win?(["x", "2", "3", 
       "x", "5", "6", 
       "x", "8", "9"]) == true
    assert TicTacToe.Board.win?(["x", "2", "3", 
       "o", "5", "6", 
       "x", "8", "9"]) == false
  end

  test "a diagonal of all the same is recognised as a win?" do
    assert TicTacToe.Board.win?(["x", "2", "3", 
       "4", "x", "6", 
       "7", "8", "x"]) == true
    assert TicTacToe.Board.win?(["x", "2", "3", 
       "4", "x", "6", 
       "7", "8", "o"]) == false
  end

  test "board marks a cell with given symbol" do
    assert TicTacToe.Board.mark_cell(["1", "2", "3", "4", "5", "6", "7", "8", "9"], "1", "x") == ["x", "2", "3",
     "4", "5", "6",
     "7", "8", "9"]
  end

  test "board does not mark a cell that is not available" do
    assert TicTacToe.Board.mark_if_available(["o", "2", "3", "4", "5", "6", "7", "8", "9"], "1", "x") == :not_available
  end

end
