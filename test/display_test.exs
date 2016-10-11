defmodule TicTacToeTest.Display do
  use ExUnit.Case
  import ExUnit.CaptureIO
  
  test "asks player to set name and continuously prints invalid message until name is valid" do
    assert capture_io("123\n!@£\ndaisy", fn ->
      TicTacToe.Display.request_to_validate(:name, "Player 1")
    end) =~ "Player 1, please input your name: \n\nThat is an invalid name.\n Please try again without using any non-letters: \nThat is an invalid name.\n Please try again without using any non-letters: "
  end

  test "asks player to set marker and continuously prints invalid message until marker is valid" do
    assert capture_io("1\n$w\nx", fn ->
      TicTacToe.Display.request_to_validate(:marker, "Gary")
    end) =~ "Gary, please choose a marker of any single character that is not a number: \n\nThat is an invalid marker.\n Choose a single character that is not a number: \nThat is an invalid marker.\n Choose a single character that is not a number: "
  end

  test "asks player to take turn and continuously prints invalid message until turn is valid" do
    assert capture_io("x\n$w\n1", fn ->
      TicTacToe.Display.request_to_validate(:turn, "Gary")
    end) =~ "Gary's turn, input the number of the position that you would like to mark: \n\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: \nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "
  end

  test "displays current board" do
    assert capture_io(fn ->
      TicTacToe.Display.display_board(["1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"]) 
    end) =~ "1 2 3\n4 5 6\n7 8 9"
  end

  test "returns message for draw" do
    assert capture_io(fn ->
      TicTacToe.Display.draw_message 
    end) =~ "It's a draw!"
  end

  test "congratulates winner" do
    assert capture_io(fn ->
      TicTacToe.Display.congratulate_winner("Barry") 
    end) =~ "Barry won! Congratulations!"
  end
end
