defmodule TicTacToe.Board do

  def create_new_board do
    [ "1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"
    ]
  end

  def win?(current_board) do
    row_win(current_board)
  end

  def row_win(current_board) do
    Enum.any?(rows(current_board), fn(row) ->
      Enum.uniq(row)
      |> Enum.count == 1
    end)
  end

  def rows(current_board) do
    Enum.chunk(current_board, 3)
  end

end
