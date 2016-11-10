defmodule TicTacToe.Minimax do

  def best_move(current_board, {player_1, player_2}) do
    minimax(current_board, 0, {player_1, player_2}, true, 100)
  end

  def minimax(current_board, depth, {player_1, player_2}, maximising_player, best_value) do
    cond do
      terminal?(find_values(current_board, player_1)) ->
        give_terminal_value(find_values(current_board, player_1))
      maximising_player ->
        val = Enum.map(possible_moves(current_board, player_1), fn(possible_move) ->
          minimax(possible_move, depth - 1, {player_2, player_1}, false, -best_value)
        end)
      |> Enum.max
      max(best_value, elem(val, 0))
      :else ->
        val = Enum.map(possible_moves(current_board, player_1), fn(possible_move) ->
          minimax(possible_move, depth - 1, {player_1, player_2}, true, best_value)
        end)
      |> Enum.max
      # |> negate
      min(best_value, elem(val, 0))
    end
  end

  # def negate({score, cell}) do
  #   {-score, cell}
  # end

  def terminal?(minimax_values) do
    Enum.count(minimax_values) == 1 or Enum.any?(minimax_values, fn({value, _}) ->
      value == 1
    end)
  end

  def give_terminal_value(minimax_values) do
    Enum.max(minimax_values)
  end

  def find_values(current_board, player_1) do
    Enum.map(possible_moves(current_board, player_1), fn(possible_board) ->
      if TicTacToe.Board.win?(possible_board) do
        {1, changed_cell(current_board, possible_board)} 
      else
        {0, changed_cell(current_board, possible_board)} 
      end
    end)
  end

  def possible_moves(current_board, player_1) do
    Enum.map(available_cells(current_board), fn(cell_to_mark) ->
      ghost_mark(cell_to_mark, player_1.marker, current_board)
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
