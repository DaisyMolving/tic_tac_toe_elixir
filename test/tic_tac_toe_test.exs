defmodule TicTacToeTest do
  use ExUnit.Case

  test "a board has 9 spaces" do
    assert Enum.count(TicTacToe.Board.create_new_board) == 9
  end

  test "a new board is empty" do
    assert Enum.all?(TicTacToe.Board.create_new_board, fn(space) ->
      String.to_integer(space)
    end) == true
  end

  test "a row of all the same is recognised as a win" do
    assert TicTacToe.Board.win?( 
      [ "x", "x", "x",
        "4", "5", "6",
        "7", "8", "9",
      ]) == true
  end

end
