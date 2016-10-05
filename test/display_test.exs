defmodule TicTacToeTest.Display do
  use ExUnit.Case
  import ExUnit.CaptureIO
  
  test "prints farewell message if input is q or Q, otherwise continues" do
    assert capture_io("q", fn ->
      TicTacToe.Display.ask_to_play_or_end
    end) =~ "Welcome to TicTacToe! To play, press any key to continue, or q to quit: Goodbye"
    assert capture_io("Q", fn ->
      TicTacToe.Display.ask_to_play_or_end
    end) =~ "Welcome to TicTacToe! To play, press any key to continue, or q to quit: Goodbye"
    assert capture_io("o", fn ->
      TicTacToe.Display.ask_to_play_or_end
    end) =~ "Welcome to TicTacToe! To play, press any key to continue, or q to quit:"
  end

  test "asks player to set name and continuously prints invalid message until name is valid" do
    assert capture_io("1234\n!@£$\nDaisy", fn ->
      TicTacToe.Display.ask_for_name("1")
    end) =~ "Player 1, please input your name: Sorry, that is not a valid input. Player 1, please input your name: Sorry, that is not a valid input."
  end

  test "asks player to set marker and continuously prints invalid message until marker is valid" do
    assert capture_io("1\n$w\nx", fn ->
      TicTacToe.Display.ask_for_marker("Gary")
    end) =~ "Gary, please choose a marker of any single character that is not a number. Sorry, that is not a valid input. Gary, please choose a marker of any single character that is not a number. Sorry, that is not a valid input."
  end

  test "asks player to take turn and continuously prints invalid message until turn is valid" do
    assert capture_io("x\n$w\n1", fn ->
      TicTacToe.Display.ask_for_turn("Gary")
    end) =~ "Gary's turn, input the number of the position that you would like to mark: Sorry, that is not a valid input. Gary's turn, input the number of the position that you would like to mark: Sorry, that is not a valid input."
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
