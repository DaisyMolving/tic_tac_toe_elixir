defmodule TicTacToeTest.Validator do
  use ExUnit.Case

  test "returns valid name" do
    assert TicTacToe.Validator.validate_name("Gary") == {:ok, "Gary"}
  end

  test "returns valid marker" do
    assert TicTacToe.Validator.validate_marker("x") == {:ok, "x"}
  end

  test "returns valid turn" do
    assert TicTacToe.Validator.validate_turn("1") == {:ok, "1"}
  end

  test "validates whether to play again" do
    assert TicTacToe.Validator.validate_play_again("y") == {:ok, "y"}
    assert TicTacToe.Validator.validate_play_again("Y") == {:ok, "Y"}
    assert TicTacToe.Validator.validate_play_again("n") == {:ok, "n"}
    assert TicTacToe.Validator.validate_play_again("N") == {:ok, "N"}
  end

end
