defmodule TicTacToeTest.Minimax do
  use ExUnit.Case

  test "returns terminal move when only option" do
    current_board =  ["x", "o", "3",
                      "o", "x", "x",
                      "o", "x", "o"]
    assert TicTacToe.Minimax.best_move(current_board, "x") == "3"
    current_board =  ["1", "o", "x",
                      "o", "x", "x",
                      "o", "x", "o"]
    assert TicTacToe.Minimax.best_move(current_board, "x") == "1"
  end

  test "gives possible_boards" do
    current_board = ["1", "o", "3"]
    assert TicTacToe.Minimax.possible_boards(current_board, "x") == [["x", "o", "3"],["1", "o", "x"]]
  end

  test "returns values of board" do
    current_board = ["1", "o", "3",
                     "4", "x", "6",
                     "o", "8", "x"]
    possible_boards = TicTacToe.Minimax.possible_boards(current_board, "x")
    assert TicTacToe.Minimax.evaluate(possible_boards, current_board) == [{1, "1"}, {0, "3"}, {0, "4"}, {0, "6"}, {0, "8"}]
  end

  test "returns best move when terminal due to win" do
    current_board =   ["x", "o", "3",
                      "4", "x", "6",
                      "o", "8", "9"]
    assert TicTacToe.Minimax.best_move(current_board, "x") == "9"
    current_board =   ["1", "o", "3",
                      "4", "x", "6",
                      "o", "8", "x"]
    assert TicTacToe.Minimax.best_move(current_board, "x") == "1"
  end

  # test "returns best move for blocking win of opponent" do
  #   current_board =   ["1", "2", "3",
  #                     "4", "x", "o",
  #                     "o", "8", "x"]
  #   assert TicTacToe.Minimax.best_move(current_board, "o") == "1"
  # end

end
