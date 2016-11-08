defmodule TicTacToe.Minimax do

  def best_move(current_board, {max_player, min_player}) do
    elem(minimax(current_board, {max_player, min_player}), 1)
  end

  def minimax(current_board, {max_player, min_player}) do
    cond do
      terminal?(find_values(current_board, max_player)) ->
        give_terminal_value(find_values(current_board, max_player))
    end
  end

  def terminal?(minimax_values) do
    Enum.count(minimax_values) == 1 or Enum.any?(minimax_values, fn({value, _}) ->
      value == 1
    end)
  end

  def give_terminal_value(minimax_values) do
    if Enum.count(minimax_values) == 1 do
      Enum.at(minimax_values, 0)
    else
      Enum.max(minimax_values)
    end
  end

  def find_values(current_board, max_player) do
    Enum.map(possible_moves(current_board, max_player), fn(possible_board) ->
      if TicTacToe.Board.win?(possible_board) do
        {1, changed_cell(current_board, possible_board)} 
      else
        {0, changed_cell(current_board, possible_board)} 
      end
    end)
  end

  def possible_moves(current_board, max_player) do
    Enum.map(available_cells(current_board), fn(cell_to_mark) ->
      ghost_mark(cell_to_mark, max_player.marker, current_board)
    end)
  end

  def available_cells(current_board) do
    Enum.filter(current_board, fn(cell) ->
      unmarked?(cell)
    end)
  end

  def unmarked?(cell) do
    String.match?(cell, ~r/^[1-9]$/)
  end

  def ghost_mark(cell, marker, current_board) do
    List.replace_at(current_board, String.to_integer(cell) - 1, marker)
  end

  def changed_cell(current_board, marked_board) do
    Enum.find(Enum.zip(current_board, marked_board), fn({x, y}) ->
      x != y
    end)
    |> elem(0)
  end
    
end
