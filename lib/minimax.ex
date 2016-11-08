defmodule TicTacToe.Minimax do

  def best_move(current_board, {max_player, min_player}) do
    elem(minimax(current_board, [], {max_player, min_player}), 1)
  end

  def minimax(current_board, minimax_values, {max_player, min_player}) do
    cond do
      terminal?(find_values(current_board, max_player)) ->
        {0, "3"}
    end
  end

  def terminal?(minimax_values) do
    Enum.count(minimax_values) == 1 or Enum.any?(minimax_values, fn({value, cell_number}) ->
      value == 1
    end)
  end

  def find_values(current_board, max_player) do
    Enum.map(possible_moves(current_board, max_player), fn(possible_board) ->
      if TicTacToe.Board.win?(possible_board) do
        {1, "1"}
      else
        {0, "3"}
      end
    end)
    # for every available cell on the board return a new board with that cell marked, and determine whether a win for max_player or draw and return these tuples of minimax value and cell number in a list.
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
    
end
