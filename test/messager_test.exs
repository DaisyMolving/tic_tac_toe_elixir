defmodule TicTacToeTest.Messager do
  use ExUnit.Case

  test "displays current board" do
    assert TicTacToe.Messager.format_board(["1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"])  =~ "1 2 3\n4 5 6\n7 8 9"
  end


  test "returns welcome message" do
    assert TicTacToe.Messager.welcome_introduction =~ "Welcome to Tic Tac Toe"
  end

  test "returns request for game type" do
    assert TicTacToe.Messager.game_type_request =~ "a) a human vs human game or b) a human vs computer game"
  end

  test "returns request for name" do
    assert TicTacToe.Messager.name_input_request("Player 1") =~ "Player 1, please input your name"
  end

  test "returns request for marker" do
    assert TicTacToe.Messager.marker_input_request("Gary") =~ "Gary, please choose a marker"
  end

  test "returns request for turn" do
    assert TicTacToe.Messager.turn_input_request("Gary", "x") =~ "Gary's turn with the marker x"
  end

  test "returns message for unavailable cell" do
    assert TicTacToe.Messager.unavailable_cell =~ "That position is unavailable"
  end

  test "returns message for draw" do
    assert TicTacToe.Messager.draw_message =~ "It's a draw!"
  end

  test "congratulates winner" do
    assert TicTacToe.Messager.congratulate_winner("Barry")  =~ "Barry won! Congratulations!"
  end

  test "returns invalid message for game type" do
    assert TicTacToe.Messager.game_type_input_failure =~ "not a valid response for game type"
  end

  test "returns invalid message for name" do
    assert TicTacToe.Messager.name_input_failure =~ "invalid name"
  end

  test "returns invalid message for marker" do
    assert TicTacToe.Messager.marker_input_failure =~ "invalid marker"
  end

  test "returns invalid message for turn" do
    assert TicTacToe.Messager.turn_input_failure =~ "not a valid turn"
  end

  test "returns play again request" do
    assert TicTacToe.Messager.play_again_input_request =~ "play again"
  end

end
