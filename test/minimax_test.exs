defmodule TicTacToeTest.Minimax do
  use ExUnit.Case

  test "returns best move for terminal move when only option" do
    current_board =  ["x", "o", "3",
                      "o", "x", "x",
                      "o", "x", "o"]
    assert TicTacToe.Minimax.best_move(current_board) == "3"
    current_board =  ["1", "o", "x",
                      "o", "x", "x",
                      "o", "x", "o"]
    assert TicTacToe.Minimax.best_move(current_board) == "1"
  end

end
