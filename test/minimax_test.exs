defmodule TicTacToeTest.Minimax do
  use ExUnit.Case

  test "minimax values are determined" do
    current_board = ["o", "2", "x", "x", "x", "o", "7", "8", "o"]
    player_1 = TicTacToe.HumanPlayer.build("Computer", "x")
    player_2 = TicTacToe.HumanPlayer.build("gary", "o")
    assert TicTacToe.Minimax.minimax(current_board, {player_1, player_2}) == ["o", "zero", "x", "x", "x", "o", "one", "zero", "o"]
  end

  test "current player returns possible moves for next turn on one board for each move" do
    current_board = ["x", "o", "o", "o", "x", "6", "7", "8", "9"]
    assert TicTacToe.Minimax.return_possible_moves(current_board, "x") == [
      ["x", "o", "o", "o", "x", "x", "7", "8", "9"],
      ["x", "o", "o", "o", "x", "6", "x", "8", "9"],
      ["x", "o", "o", "o", "x", "6", "7", "x", "9"],
      ["x", "o", "o", "o", "x", "6", "7", "8", "x"]]
  end

  test "current player chooses to win" do
    current_board = ["x", "o", "o",
                     "o", "x", "6",
                     "7", "8", "9"]
    player_1 = TicTacToe.HumanPlayer.build("Computer", "x")
    player_2 = TicTacToe.HumanPlayer.build("gary", "o")
    assert TicTacToe.Minimax.best_move(current_board, {player_1, player_2}) == "9"
  end

  test "current player chooses to block" do
    current_board = ["x", "o", "o",
                     "4", "x", "6",
                     "7", "8", "9"]
    player_1 = TicTacToe.HumanPlayer.build("Computer", "o")
    player_2 = TicTacToe.HumanPlayer.build("gary", "x")
    assert TicTacToe.Minimax.best_move(current_board, {player_1, player_2}) == "9"
  end

  test "current player blocks future opponent win" do
    current_board = ["x", "2", "3",
                     "4", "o", "6",
                     "7", "8", "x"]
    player_1 = TicTacToe.HumanPlayer.build("Computer", "o")
    player_2 = TicTacToe.HumanPlayer.build("gary", "x")
    assert Enum.member?(["2", "3", "4", "6", "7", "8"], TicTacToe.Minimax.best_move(current_board, {player_1, player_2}))
  end

  test "blocks another fork attempt" do
    current_board = ["x", "2", "3",
                     "4", "x", "6",
                     "7", "8", "o"]
    player_1 = TicTacToe.HumanPlayer.build("Computer", "o")
    player_2 = TicTacToe.HumanPlayer.build("gary", "x")
    assert Enum.member?(["3", "7"], TicTacToe.Minimax.best_move(current_board, {player_1, player_2}))
  end

  test "blocks another alternative fork attempt" do
    current_board = ["1", "2", "3",
                     "4", "5", "x",
                     "7", "x", "o"]
    player_1 = TicTacToe.HumanPlayer.build("Computer", "o")
    player_2 = TicTacToe.HumanPlayer.build("gary", "x")
    assert Enum.member?(["5", "4", "2"], TicTacToe.Minimax.best_move(current_board, {player_1, player_2}))
  end

  test "blocks player while also trying to win" do
    current_board = ["x", "2", "3",
                     "o", "5", "x",
                     "o", "x", "o"]
    player_1 = TicTacToe.HumanPlayer.build("Computer", "o")
    player_2 = TicTacToe.HumanPlayer.build("gary", "x")
    assert Enum.member?(["5", "2"], TicTacToe.Minimax.best_move(current_board, {player_1, player_2}))
  end

  test "computer ends game with a draw" do
    current_board = ["x", "o", "3",
                     "o", "x", "x",
                     "o", "x", "o"]
    player_1 = TicTacToe.HumanPlayer.build("Computer", "o")
    player_2 = TicTacToe.HumanPlayer.build("gary", "x")
    assert TicTacToe.Minimax.best_move(current_board, {player_1, player_2}) == "3"
  end

  test "knows when last turn" do
    current_board = ["x", "o", "3",
                     "o", "x", "x",
                     "o", "x", "o"]
    assert TicTacToe.Minimax.last_turn?(current_board) == true 
  end

end
