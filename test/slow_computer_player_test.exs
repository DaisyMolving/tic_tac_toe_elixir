defmodule TicTacToeTest.SlowComputerPlayer do
  use ExUnit.Case

  test "computer player has a default name and marker" do
    new_player = %TicTacToe.SlowComputerPlayer{}
    assert new_player.name == "Computer"
    assert new_player.marker == "o"
  end

  test "builds new player" do
    new_player = TicTacToe.SlowComputerPlayer.build("Computer", "o")
    assert new_player.name == "Computer"
    assert new_player.marker == "o"
    assert new_player.score == 0
  end

  test "computer player updates score" do
    computer_player = TicTacToe.SlowComputerPlayer.build("Computer", "x")
    assert TicTacToe.ComputerPlayer.update_score(computer_player) == %TicTacToe.ComputerPlayer{marker: "x", name: "Computer", score: 1}
  end

end
