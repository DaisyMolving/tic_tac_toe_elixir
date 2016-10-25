defmodule TicTacToeTest.ComputerPlayer do
  use ExUnit.Case

  test "computer player has a default name and marker" do
    new_player = %TicTacToe.ComputerPlayer{}
    assert new_player.name == "Computer"
    assert new_player.marker == "o"
  end

  test "computer player chooses a random number" do
    list_of_numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    assert Enum.member?(list_of_numbers, TicTacToe.ComputerPlayer.choose_random_number)
  end

  test "current player returns possible moves for next turn on one board for each move" do
    current_board = ["x", "o", "o", "o", "x", "6", "7", "8", "9"]
    assert TicTacToe.ComputerPlayer.return_possible_boards(current_board, "x") == [
      ["x", "o", "o", "o", "x", "x", "7", "8", "9"],
      ["x", "o", "o", "o", "x", "6", "x", "8", "9"],
      ["x", "o", "o", "o", "x", "6", "7", "x", "9"],
      ["x", "o", "o", "o", "x", "6", "7", "8", "x"]]
  end

end
