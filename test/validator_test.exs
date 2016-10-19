defmodule TicTacToeTest.Validator do
  use ExUnit.Case

  test "returns valid name" do
    assert TicTacToe.Validator.validate_input("Gary", :name) == {:ok, "Gary"}
  end

  test "returns failure message if name is invalid" do
    assert TicTacToe.Validator.validate_input("123", :name) == 
      {:error, "\nThat is an invalid name.\n Please try again without using any non-letters: "}
    assert TicTacToe.Validator.validate_input("€#¢", :name) == 
      {:error, "\nThat is an invalid name.\n Please try again without using any non-letters: "}
  end

  test "returns valid marker" do
    assert TicTacToe.Validator.validate_input("x", :marker) == {:ok, "x"}
  end

  test "returns failure message if marker is invalid" do
    assert TicTacToe.Validator.validate_input("3", :marker) == 
      {:error, "\nThat is an invalid marker.\n Choose a single character that is not a number: "}
    assert TicTacToe.Validator.validate_input("$q", :marker) == 
      {:error, "\nThat is an invalid marker.\n Choose a single character that is not a number: "}
  end

  test "returns valid turn" do
    assert TicTacToe.Validator.validate_input("1", :turn) == {:ok, "1"}
  end

  test "returns failure message if turn is invalid" do
    assert TicTacToe.Validator.validate_input("$", :turn) == {:error, "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "}
    assert TicTacToe.Validator.validate_input("-9", :turn) == {:error, "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "}
    assert TicTacToe.Validator.validate_input("hello", :turn) == {:error, "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "}
  end

  test "validates whether to play again" do
    assert TicTacToe.Validator.validate_input("y", :play_again) == {:ok, "y"}
    assert TicTacToe.Validator.validate_input("Y", :play_again) == {:ok, "Y"}
    assert TicTacToe.Validator.validate_input("n", :play_again) == {:ok, "n"}
    assert TicTacToe.Validator.validate_input("N", :play_again) == {:ok, "N"}
  end

  test "returns failure message if play again response is invalid" do
    assert TicTacToe.Validator.validate_input("3", :play_again) == 
      {:error, "\nThat is not a valid answer, please type y for yes or n for no: "}
  end

end
