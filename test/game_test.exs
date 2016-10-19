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
    end) =~ "please input your name: \n\nWelcome Player 2,"
  end

  test "does not build players until name input is valid" do
    assert capture_io("123\nBarry\nGary", fn ->
      TicTacToe.Game.build_players 
    end) =~ "invalid name"
  end

end
