defmodule TicTacToe.Minimax do

  def best_move(current_board, {player_1, player_2}) do
    result1 = minimax(current_board, {player_1, player_2})
    result2 = minimax(current_board, {player_2, player_1})
    cond do
      last_turn?(current_board) ->
        place_last_marker(current_board)
      Enum.member?(result1, "one") ->
        return_cell_number(minimax(current_board, {player_1, player_2}), "one")
      Enum.member?(result2, "one") ->
      return_cell_number(minimax(current_board, {player_2, player_1}), "one")
      :else ->
        possibilities = Enum.map(return_possible_moves(current_board, player_1.marker), fn(possible_move) ->
          best_move(possible_move, {player_2, player_1})
        end)
        Enum.find(possibilities, fn(x) -> is_binary(x) end)
    end
  end

  def place_last_marker(current_board) do
    Enum.find(current_board, fn(x) ->
      String.match?(x, ~r/[1-9]/)
    end)
  end

  def last_turn?(current_board) do
    Enum.partition(current_board, fn(x) ->
      String.match?(x, ~r/[1-9]/)
    end)
    |> elem(0)
    |> Enum.count == 1
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