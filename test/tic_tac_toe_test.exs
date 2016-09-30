defmodule TicTacToeTest do
  use ExUnit.Case

  test "a board has 9 spaces" do
    assert Enum.count(TicTacToe.Board.create_new_board) == 9
  end

end
