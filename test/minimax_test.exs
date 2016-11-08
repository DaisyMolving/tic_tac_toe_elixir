defmodule TicTacToeTest.Minimax do
  use ExUnit.Case

  test "returns list of available cells for possible_moves" do
    current_board = ["x", "o", "3",
                     "o", "x", "x",
                     "o", "x", "o"]
    assert TicTacToe.Minimax.available_cells(current_board) == ["3"]
  end

  test "returns minimax value and cell for every possible move" do
    current_board = ["1", "o", "3",
                     "o", "x", "x",
                     "o", "x", "o"]
    max_player = TicTacToe.HumanPlayer.build("Computer", "o")
    assert TicTacToe.Minimax.find_values(current_board, max_player) == [{1, "1"}, {0, "3"}]
  end

  # test "computer marks only remaining available space" do
  #   current_board = ["x", "o", "3",
  #                    "o", "x", "x",
  #                    "o", "x", "o"]
  #   player_1 = TicTacToe.HumanPlayer.build("Computer", "o")
  #   player_2 = TicTacToe.HumanPlayer.build("gary", "x")
  #   assert TicTacToe.Minimax.best_move(current_board, {player_1, player_2}) == "3"
  # end

end
