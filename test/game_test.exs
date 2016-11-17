defmodule TicTacToeTest.Game do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "game greets players" do
    assert capture_io(fn ->
      TicTacToe.Game.welcome_players
    end) =~ "Welcome to Tic Tac Toe"
  end

  test "builds human player" do
    assert capture_io("Barry", fn ->
      TicTacToe.Game.build_human_player("Player 1", "x")
    end) =~ "please input your name:"
  end

  test "does not build players until name input is valid" do
    assert capture_io("£$%\n123\nBarry", fn ->
      TicTacToe.Game.build_human_player("Player 1", "x")
    end) =~ "invalid name"
  end

  test "displays the board" do
    assert capture_io(fn ->
      TicTacToe.Game.display_board(["1", "2", "3", "4", "5", "6", "7", "8", "9"])
    end) =~ "1 2 3\n4 5 6\n7 8 9"
  end

  test "players take turns until someone wins" do
    current_board = TicTacToe.Board.create_new_board
    player_1 = TicTacToe.HumanPlayer.build("gary", "x")
    player_2 = TicTacToe.HumanPlayer.build("barry", "o")
    assert capture_io("1\n2\n5\n4\n9\nn", fn ->
      TicTacToe.Game.take_turn(current_board, {player_1, player_2}, %{}) 
    end) =~ "Gary won"
  end

  test "given all possible inputs in human vs human game a player can win" do
    assert capture_io("y\na\n123\n€#¢\nGary\nBarry\na\nr\n-2\n1\n2\n5\n4\n9\nI'm done", fn ->
      TicTacToe.Game.play_tic_tac_toe
    end) =~ "Gary won!"
  end

  test "given all possible inputs in human vs human game players can draw" do
    assert capture_io("5\na\nGary\nBarry\na\n1\n1\n2\n3\n5\n8\n6\n4\n7\n9\nI'm done", fn ->
      TicTacToe.Game.play_tic_tac_toe
    end) =~ "It's a draw"
  end

  test "players can play again" do
    assert capture_io("yes\na\nDaisy\nAlex\n1\n2\n5\n4\n9\ndone", fn -> 
     TicTacToe.Game.decide_to_play_again(%{})
    end) =~ "Welcome to Tic Tac Toe"
  end

  test "a computer vs computer game plays" do
    assert capture_io("d\nI'm done", fn -> 
      TicTacToe.Game.play_tic_tac_toe
    end) =~ "Computer 1's turn"
  end

  test "shows score when one game ends" do
    assert capture_io("a\nGary\nBarry\n1\n2\n5\n4\n9\nI'm done", fn ->
      TicTacToe.Game.play_tic_tac_toe
    end) =~ "Gary: 1"
  end

  test "keeps score for multiple running games" do
    assert capture_io("a\nGary\nBarry\n1\n2\n5\n4\n9\nyes\na\nGary\nBarryn8\n1\n2\n5\n4\n9\nI'm done", fn ->
      TicTacToe.Game.play_tic_tac_toe
    end) =~ "Gary: 2"
  end

  test "adds player scores for new players" do
    player_scores = %{}
    player_1 = TicTacToe.HumanPlayer.build("gary", "x")
    player_2 = TicTacToe.HumanPlayer.build("barry", "o")
    assert TicTacToe.Game.add_player_scores(player_scores, player_1, player_2) == %{"Gary" => 0, "Barry" => 0}

  end

  test "retains player scores for continuing players" do
    player_scores = %{"Gary" => 1}
    player_1 = TicTacToe.HumanPlayer.build("gary", "x")
    player_2 = TicTacToe.HumanPlayer.build("barry", "o")
    assert TicTacToe.Game.add_player_scores(player_scores, player_1, player_2) == %{"Gary" => 1, "Barry" => 0}

    player_scores = %{"Barry" => 1}
    player_1 = TicTacToe.HumanPlayer.build("gary", "x")
    player_2 = TicTacToe.HumanPlayer.build("barry", "o")
    assert TicTacToe.Game.add_player_scores(player_scores, player_1, player_2) == %{"Gary" => 0, "Barry" => 1}
  end

end
