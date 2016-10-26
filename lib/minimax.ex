defmodule TicTacToe.Minimax do

  def best_move(current_board, {player_1, player_2}) do
    cond do
      Enum.member?(minimax(current_board, {player_1, player_2}), "one") ->
        return_cell_number(minimax(current_board, {player_1, player_2}), "one")
      Enum.member?(minimax(current_board, {player_2, player_1}), "one") ->
      return_cell_number(minimax(current_board, {player_2, player_1}), "one")
      :else ->
        Enum.each(return_possible_moves(current_board, player_1.marker), fn(possible_move) ->
          IO.inspect(possible_move)
          best_move(possible_move, {player_1, player_2})
        end)
    end
  end

  def minimax(current_board, {player_1, _player_2}) do
    return_possible_moves(current_board, player_1.marker)
    |> mark_minimax_values(current_board)
  end

  def return_possible_moves(current_board, marker) do
    return_possible_moves([], current_board, current_board, marker)
  end

  def return_possible_moves(possible_boards, [], _board, _marker), do: possible_boards
  def return_possible_moves(possible_boards, [head | tail], current_board, marker) do
    if unmarked?(head) do
      List.insert_at(possible_boards, -1, ghost_mark(head, marker, current_board))
      |> return_possible_moves(tail, current_board, marker)
    else
      return_possible_moves(possible_boards, tail, current_board, marker)
    end
  end

  defp mark_minimax_values([], current_board), do: current_board
  defp mark_minimax_values([head | tail], current_board) do
      case TicTacToe.Board.win?(head) do
      true ->
          mark_minimax_values(tail, List.replace_at(current_board, first_free_cell_index(current_board), "one"))
      false ->
        mark_minimax_values(tail, List.replace_at(current_board, first_free_cell_index(current_board), "zero"))
    end
  end

  defp first_free_cell_index(current_board) do
    String.to_integer(Enum.find(current_board, fn(x) ->
          String.match?(x, ~r/[1-9]/)
        end)) - 1
  end

  defp unmarked?(cell) do
    String.match?(cell, ~r/[1-9]/)
  end

  defp ghost_mark(cell, marker, current_board) do
    List.replace_at(current_board, String.to_integer(cell) - 1, marker) 
  end

  defp return_cell_number(current_board, win_or_lose) do
    Enum.find_index(current_board, fn(x) -> x == win_or_lose end) + 1
    |> Integer.to_string
  end

end
