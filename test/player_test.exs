defmodule TicTacToeTest.Player do
  use ExUnit.Case

  test "player has a default name and marker" do
    new_player = %TicTacToe.Player{}
    assert new_player.name == "Player"
    assert new_player.marker == "x"
  end

  test "player has a name that is capitalized" do
    assert TicTacToe.Player.name("Daisy") == "Daisy"
    assert TicTacToe.Player.name("daisy") == "Daisy"
  end

  test "player has a marker" do
    assert TicTacToe.Player.marker("x") == "x"
  end

end
