defmodule TicTacToeTest.UI do
  use ExUnit.Case
  
  test "greets users and introduces game" do
    assert TicTacToe.UI.welcome_introduction =~ "Welcome to TicTacToe! This is a two player strategy game"

  end

  test "asks each player to set their name" do
    assert TicTacToe.UI.request_set_player_name("1") =~ "Player 1, please input your name: "
  end

  test "asks each player to set their marker" do
    assert TicTacToe.UI.request_set_player_marker("Barry") =~ "Thank you Barry, now please choose a marker"
  end

  test "returns invalid input message for invalid marker" do
    assert TicTacToe.UI.invalid_marker_message("Barry") =~ "Barry, that is not a valid marker. Please choose a single symbol that is NOT a number: "
  end

  test "tells the users whose turn it is" do
    assert TicTacToe.UI.turn_message("Barry") =~ "It's Barry's turn, input the number of the position that you would like to mark: "
  end

  test "displays current board" do
    assert TicTacToe.UI.display_board(["1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"]) == "1 2 3\n4 5 6\n7 8 9"
  end

  test "returns invalid message for invalid input" do
    assert TicTacToe.UI.invalid_input =~ "That is an invalid input, please try again: "
  end

  test "returns message for draw" do
    assert TicTacToe.UI.draw_message =~ "It's a draw!"
  end

  test "congratulates winner" do
    assert TicTacToe.UI.congratulate_winner("Barry") =~ "Barry won! Congratulations!"
  end
end
