defmodule TicTacToeTest.Validator do
  use ExUnit.Case

  test "returns valid name" do
    assert TicTacToe.Validator.validate_name("Gary") == {:ok, "Gary"}
  end

  test "returns failure message if name is invalid" do
    assert TicTacToe.Validator.validate_name("123") == 
      {:error, "\nThat is an invalid name.\n Please try again without using any non-letters: "}
    assert TicTacToe.Validator.validate_name("€#¢") == 
      {:error, "\nThat is an invalid name.\n Please try again without using any non-letters: "}
  end

  test "returns valid marker" do
    assert TicTacToe.Validator.validate_marker("x") == {:ok, "x"}
  end

  test "returns failure message if marker is invalid" do
    assert TicTacToe.Validator.validate_marker("3") == 
      {:error, "\nThat is an invalid marker.\n Choose a single character that is not a number: "}
    assert TicTacToe.Validator.validate_marker("$q") == 
      {:error, "\nThat is an invalid marker.\n Choose a single character that is not a number: "}
  end

  test "returns valid turn" do
    assert TicTacToe.Validator.validate_turn("1") == {:ok, "1"}
  end

  test "returns failure message if turn is invalid" do
    assert TicTacToe.Validator.validate_turn("$") == {:error, "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "}
    assert TicTacToe.Validator.validate_turn("-9") == {:error, "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "}
    assert TicTacToe.Validator.validate_turn("hello") == {:error, "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "}
  end

  test "validates whether to play again" do
    assert TicTacToe.Validator.validate_play_again("y") == {:ok, "y"}
    assert TicTacToe.Validator.validate_play_again("Y") == {:ok, "Y"}
    assert TicTacToe.Validator.validate_play_again("n") == {:ok, "n"}
    assert TicTacToe.Validator.validate_play_again("N") == {:ok, "N"}
  end

  test "returns failure message if play again response is invalid" do
    assert TicTacToe.Validator.validate_play_again("3") == 
      {:error, "\nThat is not a valid answer, please type y for yes or n for no: "}
  end

end
