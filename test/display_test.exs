defmodule TicTacToeTest.Display do
  use ExUnit.Case
  import ExUnit.CaptureIO
  
  test "asks player to set name" do
    assert TicTacToe.Display.validate_name("Gary") == "Gary"
  end

  test "prints name invalid message if input is invalid" do
  end

  test "asks player to set marker" do
    assert TicTacToe.Display.validate_marker("x") == "x"
  end

  test "prints marker invalid message if input is invalid" do
  end

  test "asks player to take turn" do
    assert TicTacToe.Display.validate_turn("1") == "1"
  end

  test "prints turn invalid message if input is invalid" do
  end

  test "asks players whether to play again" do
    assert TicTacToe.Display.validate_play_again("y") == "y"
    assert TicTacToe.Display.validate_play_again("Y") == "Y"
    assert TicTacToe.Display.validate_play_again("n") == "n"
    assert TicTacToe.Display.validate_play_again("N") == "N"
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
