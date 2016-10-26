defmodule TicTacToeTest.ComputerPlayer do
  use ExUnit.Case

  test "computer player has a default name and marker" do
    new_player = %TicTacToe.ComputerPlayer{}
    assert new_player.name == "Computer"
    assert new_player.marker == "o"
  end

end
