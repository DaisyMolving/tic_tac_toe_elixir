defmodule TicTacToeTest.UI do
  use ExUnit.Case
  
  test "greets users and introduces game" do
    assert TicTacToe.UI.welcome_introduction =~ "Welcome to TicTacToe! This is a two player strategy game"

  end

  test "displays current board" do
    assert TicTacToe.UI.display_board(["1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"]) == "1 2 3\n4 5 6\n7 8 9"
  end

end
