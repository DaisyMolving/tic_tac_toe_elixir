defmodule TicTacToeTest.Display do
  use ExUnit.Case
  import ExUnit.CaptureIO
  
  test "greets users and introduces game" do
    assert capture_io("y", fn ->
      TicTacToe.Display.welcome_introduction 
    end) =~ "Welcome to TicTacToe! This is a two player strategy game"
  end

  test "prints farewell message if input is q or Q, otherwise continues" do
    assert capture_io([input: "q", capture_prompt: false], fn ->
      TicTacToe.Display.ask_to_play_or_end
    end) == "Goodbye\n"
    assert capture_io([input: "Q", capture_prompt: false], fn ->
      TicTacToe.Display.ask_to_play_or_end
    end) == "Goodbye\n"
    assert capture_io([input: "o", capture_prompt: false], fn ->
      TicTacToe.Display.ask_to_play_or_end
    end) == ""
  end

  test "prints farewell message" do
    assert capture_io(fn ->
      TicTacToe.Display.farewell_message
    end) =~ "Goodbye"
  end

  test "asks each player to set their name" do
    assert capture_io("Daisy", fn ->
      TicTacToe.Display.request_set_player_name("1")
    end) =~ "Player 1, please input your name: "
  end

  test "asks player to set name and continuously prints invalid message until name is valid" do
    assert capture_io("1234\n!@£$\nDaisy", fn ->
      TicTacToe.Display.ask_for_name("1")
    end) =~ "Player 1, please input your name: Sorry, that is not a valid input. Player 1, please input your name: Sorry, that is not a valid input."
  end

  test "returns invalid input message" do
    assert capture_io("Barry", fn ->
      TicTacToe.Display.invalid_input
    end) =~ "that is not a valid input"
  end

  test "asks each player to set their marker" do
    assert capture_io("x", fn ->
      TicTacToe.Display.request_set_player_marker("Barry") 
    end) =~ "Barry, please choose a marker"
  end

  test "asks player to set marker and continuously prints invalid message until name is valid" do
    assert capture_io("1\n$w\nx", fn ->
      TicTacToe.Display.ask_for_marker("Gary")
    end) =~ "Gary, please choose a marker of any single symbol that is not a number. Sorry, that is not a valid input. Gary, please choose a marker of any single symbol that is not a number. Sorry, that is not a valid input."
  end

  test "returns invalid input message for invalid marker" do
    assert capture_io("&", fn ->
      TicTacToe.Display.invalid_marker("Barry") 
    end) =~ "Barry, that is not a valid marker"
  end

  test "tells the users whose turn it is" do
    assert capture_io("9", fn ->
      TicTacToe.Display.turn_message("Barry") 
    end) =~ "It's Barry's turn, input the number of the position that you would like to mark: "
  end

  test "returns invalid input message for invalid turn" do
    assert capture_io("12", fn ->
      TicTacToe.Display.invalid_turn("Barry") 
    end) =~ "Barry, that is not a valid turn"
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
