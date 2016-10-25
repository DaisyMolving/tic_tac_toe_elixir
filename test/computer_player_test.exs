defmodule TicTacToeTest.ComputerPlayer do
  use ExUnit.Case

  test "computer player has a default name and marker" do
    new_player = %TicTacToe.ComputerPlayer{}
    assert new_player.name == "Computer"
    assert new_player.marker == "o"
  end

  test "current player returns possible moves for next turn on one board for each move" do
    current_board = ["x", "o", "o", "o", "x", "6", "7", "8", "9"]
    assert TicTacToe.ComputerPlayer.return_possible_moves(current_board, "x") == [
      ["x", "o", "o", "o", "x", "x", "7", "8", "9"],
      ["x", "o", "o", "o", "x", "6", "x", "8", "9"],
      ["x", "o", "o", "o", "x", "6", "7", "x", "9"],
      ["x", "o", "o", "o", "x", "6", "7", "8", "x"]]
  end

  test "current player marks the best possible move" do
    current_board = ["x", "o", "o", "o", "x", "0", "0", "0", "1"]
    assert TicTacToe.ComputerPlayer.best_move(current_board) == "9"
    current_board = ["o", "0", "0", "-1", "x", "0", "o", "0", "0"]
    assert TicTacToe.ComputerPlayer.best_move(current_board) == "4"
  end

end
