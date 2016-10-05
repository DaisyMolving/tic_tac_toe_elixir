defmodule TicTacToe.Board do

  def create_new_board do
    [ "1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"
    ]
  end

  def mark_cell(current_board, cell_number, player_marker) do
    List.replace_at(current_board, get_cell_index(cell_number), player_marker)
  end

  defp get_cell_index(cell_number) do
    String.to_integer(cell_number) - 1
  end

  def win?(sequences) do
    Enum.any?(sequences, fn(sequence) ->
      Enum.uniq(sequence)
      |> Enum.count == 1
    end)
  end

  def rows(current_board) do
    Enum.chunk(current_board, 3)
  end

  def columns(current_board) do
    [a1, a2, a3, 
     b1, b2, b3, 
     c1, c2, c3] = current_board
    [[a1, b1, c1], [a2, b2, c2], [a3, b3, c3]]
  end

  def diagonals(current_board) do
    [a1, _, a3, 
     _, b2, _, 
     c1, _, c3] = current_board
    [[a1, b2, c3], [a3, b2, c1]]
  end
end
