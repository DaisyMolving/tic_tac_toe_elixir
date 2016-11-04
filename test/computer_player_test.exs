defmodule TicTacToeTest.ComputerPlayer do
  use ExUnit.Case

  test "computer player has a default name and marker" do
    new_player = %TicTacToe.ComputerPlayer{}
    assert new_player.name == "Computer"
    assert new_player.marker == "o"
  end

  test "computer player updates score" do
    computer_player = TicTacToe.ComputerPlayer.build("Computer", "x")
    assert TicTacToe.ComputerPlayer.update_score(computer_player) == %TicTacToe.ComputerPlayer{marker: "x", name: "Computer", score: 1}
  end
end
