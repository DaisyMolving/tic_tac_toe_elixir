defmodule TicTacToe.Board do

  def create_new_board do
    [ "1", "2", "3",
      "4", "5", "6",
      "7", "8", "9"
    ]
  end

  def mark_cell(cell_number, player_marker, current_board) do
    List.replace_at(current_board, get_cell_index(current_board, cell_number), player_marker)
  end

  def available_cell?(cell_number, current_board) do
    if get_cell_index(current_board, cell_number) == nil do
      false
    else
      true
    end
  end

  def win?(current_board) do
    sequences = collect_sequences(current_board)
    Enum.any?(sequences, fn(sequence) ->
      all_same?(sequence)
    end)
  end

  def draw?(current_board) do
    sequence_types = collect_sequences(current_board)
    Enum.uniq(List.flatten(sequence_types))
    |> Enum.count == 2
  end

  def collect_sequences(current_board) do
    rows(current_board) ++ columns(current_board) ++ diagonals(current_board)
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

  defp get_cell_index(current_board, cell_contents) do
    Enum.find_index(current_board, fn(x) ->
      x == cell_contents
    end) 
  end

  defp all_same?([x, x, x]), do: true
  defp all_same?(_), do: false

end
