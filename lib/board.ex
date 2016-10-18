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

  def available_cell?(current_board, cell_number) do
    Enum.at(current_board, get_cell_index(cell_number)) 
    |> String.match?(~r/[1-9]/)
  end

  defp get_cell_index(cell_number) do
    String.to_integer(cell_number) - 1
  end

  def win?(current_board) do
    sequence_types = collect_sequences(current_board)
    Enum.any?(sequence_types, fn(sequences) ->
      Enum.any?(sequences, fn(sequence) ->
        all_same?(sequence)
      end)
    end)
  end

  defp all_same?([x, x, x]), do: true
  defp all_same?(_), do: false

  def draw?(current_board) do
    sequence_types = collect_sequences(current_board)
    Enum.uniq(List.flatten(sequence_types))
    |> Enum.count == 2
  end

  def collect_sequences(current_board) do
    [rows(current_board), columns(current_board), diagonals(current_board)]
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
