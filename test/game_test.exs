defmodule TicTacToeTest.Game do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "game greets players" do
    assert capture_io(fn ->
      TicTacToe.Game.welcome_players
    end) =~ "Welcome to Tic Tac Toe"
  end

  test "builds players" do
    assert capture_io("Barry\nGary", fn ->
      TicTacToe.Game.build_players 
    end) =~ "please input your name: \n\nWelcome Player 2,"
  end

  test "does not build players until name input is valid" do
    assert capture_io("123\nBarry\nGary", fn ->
      TicTacToe.Game.build_players 
    end) =~ "invalid name"
  end

  test "displays the board" do
    assert capture_io(fn ->
      TicTacToe.Game.display_board(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    end) =~ "1 2 3\n4 5 6\n7 8 9"
  end

  test "players take turns until someone wins" do
    current_board = TicTacToe.Board.create_new_board
    player_1 = TicTacToe.Player.build("gary", "x")
    player_2 = TicTacToe.Player.build("barry", "o")
    assert capture_io("1\n2\n5\n4\n9\nn", fn ->
      TicTacToe.Game.take_turn(current_board, {player_1, player_2}) 
    end) =~ "Gary won"
  end

  test "given all possible inputs a player can win" do
    assert capture_io("123\n€#¢\nGary\nBarry\nr\n-2\n1\n2\n5\n4\n9\nI'm done", fn ->
      TicTacToe.Game.play_tic_tac_toe
    end) =~ "Gary won!"
  end

  test "given all possible inputs players can draw" do
    assert capture_io("\nGary\nBarry\n\n1\n2\n3\n5\n8\n6\n4\n7\n9\nI'm done", fn ->
      TicTacToe.Game.play_tic_tac_toe
    end) =~ "It's a draw"
  end

  test "players can play again" do
    assert capture_io("yes\nGary\nBarry\n1\n2\n5\n4\n9\ndone", fn -> 
     TicTacToe.Game.decide_to_play_again
    end) =~ "Welcome to Tic Tac Toe"
  end

end
