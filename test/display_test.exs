defmodule TicTacToeTest.Display do
  use ExUnit.Case
  import ExUnit.CaptureIO
  
  test "asks player to set name" do
    assert TicTacToe.Display.validate_name("Player 1") =~ "Player 1, please input your name:"
  end

  test "prints name invalid message if input is invalid" do
    assert capture_io("123\nblah", fn ->
      TicTacToe.Display.request_to_validate(:name, "Player 1")
    end) =~ "That is an invalid name"
  end

  test "asks player to set marker" do
    assert capture_io("x", fn ->
      TicTacToe.Display.request_to_validate(:marker, "Gary")
    end) =~ "choose a marker"
  end

  test "prints marker invalid message if input is invalid" do
    assert capture_io("123\nx", fn ->
      TicTacToe.Display.request_to_validate(:marker, "Gary")
    end) =~ "That is an invalid marker"
  end

  test "asks player to take turn" do
    assert capture_io("1", fn ->
      TicTacToe.Display.request_to_validate(:turn, "Gary")
    end) =~ "input the number of the position that you would like to mark"
  end

  test "prints turn invalid message if input is invalid" do
    assert capture_io("-9\n50\ng\n1", fn ->
      TicTacToe.Display.request_to_validate(:turn, "Gary")
    end) =~ "That is not a valid turn"
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
