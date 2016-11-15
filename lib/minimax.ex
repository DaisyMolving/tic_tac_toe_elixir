defmodule TicTacToe.Minimax do

  def best_move(current_board, current_marker) do
    minimax(current_board, current_marker)
  end

  def minimax(current_board, current_marker) do
    cond do
      terminal?(current_board, current_marker) ->
        terminal_cell(current_board, current_marker)
    end
  end

  def terminal?(current_board, current_marker) do
    terminal_draw(current_board) or terminal_win(current_board, current_marker)
  end

  def terminal_draw(current_board) do
    current_board
    |> available_cells
    |> Enum.count == 1
  end

  def terminal_win(current_board, current_marker) do
    Enum.any?(values(current_board, current_marker), fn({value, cell}) ->
      value == 1
    end)
  end

  def values(current_board, current_marker) do
    possible_boards(current_board, current_marker)
    |> evaluate(current_board)
  end

  def evaluate(possible_boards, current_board) do
    Enum.map(possible_boards, fn(possible_board) ->
      if TicTacToe.Board.win?(possible_board) do
        {1, changed_cell(current_board, possible_board)}
      else
        {0, changed_cell(current_board, possible_board)}
      end
    end)
  end

  def possible_boards(current_board, current_marker) do
    Enum.map(available_cells(current_board), fn(cell) ->
      ghost_mark(cell, current_marker, current_board)
    end)
  end

  def changed_cell(current_board, possible_board) do
    comparisons = Enum.zip(current_board, possible_board)
    Enum.find(comparisons, fn({current_cell, possible_cell}) ->
      current_cell != possible_cell
    end)
    |> elem(0)
  end

  def ghost_mark(cell, current_marker, current_board) do
    List.replace_at(current_board, String.to_integer(cell) - 1, current_marker)
  end

  def terminal_cell(current_board, current_marker) do
    current_board
    |> possible_boards(current_marker)
    |> evaluate(current_board)
    |> Enum.max
    |> elem(1)
  end
    
  def available_cells(current_board) do
    Enum.filter(current_board, fn(cell) ->
      unmarked?(cell)
    end)
  end

  def unmarked?(cell) do
    String.match?(cell, ~r/^[1-9]$/)
  end

end
