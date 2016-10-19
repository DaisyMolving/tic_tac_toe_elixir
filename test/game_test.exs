defmodule TicTacToeTest.Game do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "game greets players" do
    assert capture_io(fn ->
      TicTacToe.Game.welcome_players
    end) =~ "Welcome to Tic Tac Toe"
  end

  test "builds players" do
    assert capture_io("Barry\nGary", fn ->
      TicTacToe.Game.build_players 
    end) == ""
  end
end
