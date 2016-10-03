defmodule TicTacToeTest.UI do
  use ExUnit.Case
  
  test "greets users and introduces game" do
    assert TicTacToe.UI.welcome_introduction =~ "Welcome to TicTacToe! This is a two player strategy game"

  end

end
