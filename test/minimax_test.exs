defmodule TicTacToeTest.Minimax do
  use ExUnit.Case

  test "scores win as 1" do
    current_board =  ["1", "2", "x",
                      "o", "x", "6",
                      "x", "o", "9"]

    assert TicTacToe.Minimax.minimax(current_board, "o", true) == -1
    assert TicTacToe.Minimax.minimax(current_board, "o", false) == 1
  end

  test "scores draw as 0" do
    current_board =  ["x", "x", "o",
                      "o", "o", "x",
                      "x", "x", "o"]

    assert TicTacToe.Minimax.minimax(current_board, "x", true) == 0
    assert TicTacToe.Minimax.minimax(current_board, "x", false) == 0
  end

  test "scores possible win as a 1" do
    current_board =  ["1", "o", "o",
                      "x", "x", "o",
                      "x", "o", "x"]

    assert TicTacToe.Minimax.minimax(current_board, "x", true) == 1
    assert TicTacToe.Minimax.minimax(current_board, "x", false) == -1
  end

  test "scores possible win two moves down as a 2" do
    current_board =  ["1", "o", "3",
                      "4", "x", "o",
                      "7", "x", "9"]

    assert TicTacToe.Minimax.minimax(current_board, "x", true) == 1
    assert TicTacToe.Minimax.minimax(current_board, "x", false) == -1
  end

  test "scores an unwinnable board as 0" do
    current_board =  ["o", "2", "3",
                      "x", "x", "o",
                      "o", "8", "x"]

    assert TicTacToe.Minimax.minimax(current_board, "x", true) == 0
    assert TicTacToe.Minimax.minimax(current_board, "x", false) == 0
  end

  test "scores empty board as 0" do
    current_board =  ["1", "2", "3",
                      "4", "5", "6",
                      "7", "8", "9"]

    assert TicTacToe.Minimax.minimax(current_board, "x", true) == 0
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

  test "winning board is terminal" do
    current_board = ["x", "o", "3",
                     "4", "x", "6",
                     "o", "8", "x"]
    assert TicTacToe.Minimax.terminal?(current_board)
  end

  test "inplay board is not terminal" do
    current_board = ["1", "o", "3",
                     "4", "x", "6",
                     "o", "9", "x"]
    refute TicTacToe.Minimax.terminal?(current_board)
  end

  test "returns best move when terminal due to win" do
    current_board =   ["x", "o", "3",
                      "4", "x", "6",
                      "o", "8", "9"]
    assert TicTacToe.Minimax.best_move(current_board, "x") == "9"
    current_board =   ["1", "o", "3",
                      "4", "x", "o",
                      "o", "8", "x"]
    assert TicTacToe.Minimax.best_move(current_board, "x") == "1"
  end

  test "returns best move for blocking win of opponent" do
    current_board =   ["1", "2", "3",
                      "4", "x", "o",
                      "o", "8", "x"]
    assert TicTacToe.Minimax.best_move(current_board, "o") == "1"
    current_board =   ["1", "2", "3",
                      "4", "x", "o",
                      "x", "o", "9"]
    assert TicTacToe.Minimax.best_move(current_board, "o") == "3"
  end
end
