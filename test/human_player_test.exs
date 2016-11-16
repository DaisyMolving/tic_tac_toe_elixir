defmodule TicTacToeTest.HumanPlayer do
  use ExUnit.Case

  test "player has a default name and marker" do
    new_player = %TicTacToe.HumanPlayer{}
    assert new_player.name == "Player"
    assert new_player.marker == "x"
  end

  test "sets a name that is capitalized and a marker" do
    new_player = TicTacToe.HumanPlayer.build("daisy", "o")
    assert new_player.name == "Daisy"
    assert new_player.marker == "o"
  end

  test "human player updates score" do
    human_player = TicTacToe.ComputerPlayer.build("Daisy", "x")
    assert TicTacToe.HumanPlayer.update_score(human_player) == %TicTacToe.HumanPlayer{marker: "x", name: "Daisy", score: 1}
  end

end
