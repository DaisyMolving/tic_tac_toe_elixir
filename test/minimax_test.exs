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

end
