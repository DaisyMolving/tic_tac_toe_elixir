defmodule TicTacToeTest.Display do
  use ExUnit.Case

  test "returns valid name" do
    assert TicTacToe.Display.validate_name("Gary") == "Gary"
  end

  test "returns valid marker" do
    assert TicTacToe.Display.validate_marker("x") == "x"
  end

  test "returns valid turn" do
    assert TicTacToe.Display.validate_turn("1") == "1"
  end

  test "validates whether to play again" do
    assert TicTacToe.Display.validate_play_again("y") == "y"
    assert TicTacToe.Display.validate_play_again("Y") == "Y"
    assert TicTacToe.Display.validate_play_again("n") == "n"
    assert TicTacToe.Display.validate_play_again("N") == "N"
  end

  test "displays current board" do
    TicTacToe.Display.format_board(["1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"])  =~ "1 2 3\n4 5 6\n7 8 9"
  end

end
