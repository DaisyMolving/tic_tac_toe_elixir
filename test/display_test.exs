defmodule TicTacToeTest.Display do
  use ExUnit.Case

  test "returns valid name" do
    assert TicTacToe.Display.validate_name("Gary") == "Gary"
  end

  test "returns valid marker" do
    assert TicTacToe.Display.validate_marker("x") == "x"
  end

  test "returns valid turn" do
    assert TicTacToe.Display.validate_turn("1") == "1"
  end

  test "asks players whether to play again" do
    assert TicTacToe.Display.validate_play_again("y") == "y"
    assert TicTacToe.Display.validate_play_again("Y") == "Y"
    assert TicTacToe.Display.validate_play_again("n") == "n"
    assert TicTacToe.Display.validate_play_again("N") == "N"
  end

  test "displays current board" do
    TicTacToe.Display.format_board(["1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"])  =~ "1 2 3\n4 5 6\n7 8 9"
  end

  test "returns welcome message" do
    TicTacToe.Display.welcome_introduction =~ "Welcome to Tic Tac Toe"
  end

  test "returns request for name" do
    TicTacToe.Display.name_input_request("Player 1") =~ "Player 1, please input your name"
  end

  test "returns request for marker" do
    TicTacToe.Display.marker_input_request("Gary") =~ "Gary, please choose a marker"
  end

  test "returns request for turn" do
    TicTacToe.Display.turn_input_request("Gary", "x") =~ "Gary's turn with the marker x"
  end

  test "returns message for unavailable cell" do
    TicTacToe.Display.unavailable_cell =~ "That position is unavailable"
  end

  test "returns message for draw" do
    TicTacToe.Display.draw_message =~ "It's a draw!"
  end

  test "congratulates winner" do
    TicTacToe.Display.congratulate_winner("Barry")  =~ "Barry won! Congratulations!"
  end

  test "returns play again request" do
    TicTacToe.Display.play_again_input_request == "play again?"
  end

end
