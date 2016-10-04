defmodule TicTacToeTest.UI do
  use ExUnit.Case
  import ExUnit.CaptureIO
  
  test "greets users and introduces game" do
    assert capture_io("y", fn ->
      TicTacToe.UI.welcome_introduction 
    end) =~ "Welcome to TicTacToe! This is a two player strategy game"
  end

  test "prints farewell message" do
    assert capture_io(fn ->
      TicTacToe.UI.farewell_message
    end) =~ "Goodbye"
  end
  test "asks each player to set their name" do
    assert capture_io("Daisy", fn ->
      TicTacToe.UI.request_set_player_name("1")
    end) =~ "Player 1, please input your name: "
  end

  test "returns invalid input message for invalid player name" do
    assert capture_io("Barry", fn ->
      TicTacToe.UI.invalid_name("1") 
    end) =~ "1, that is not a valid player name"
  end

  test "asks each player to set their marker" do
    assert capture_io("x", fn ->
      TicTacToe.UI.request_set_player_marker("Barry") 
    end) =~ "Thank you Barry, now please choose a marker"
  end

  test "returns invalid input message for invalid marker" do
    assert capture_io("&", fn ->
      TicTacToe.UI.invalid_marker("Barry") 
    end) =~ "Barry, that is not a valid marker"
  end

  test "tells the users whose turn it is" do
    assert capture_io("9", fn ->
      TicTacToe.UI.turn_message("Barry") 
    end) =~ "It's Barry's turn, input the number of the position that you would like to mark: "
  end

  test "returns invalid input message for invalid turn" do
    assert capture_io("12", fn ->
      TicTacToe.UI.invalid_turn("Barry") 
    end) =~ "Barry, that is not a valid turn"
  end

  test "displays current board" do
    assert capture_io(fn ->
      TicTacToe.UI.display_board(["1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"]) 
    end) =~ "1 2 3\n4 5 6\n7 8 9"
  end

  test "returns message for draw" do
    assert capture_io(fn ->
      TicTacToe.UI.draw_message 
    end) =~ "It's a draw!"
  end

  test "congratulates winner" do
    assert capture_io(fn ->
      TicTacToe.UI.congratulate_winner("Barry") 
    end) =~ "Barry won! Congratulations!"
  end
end
