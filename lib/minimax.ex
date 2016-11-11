defmodule TicTacToe.Minimax do

  def best_move(current_board) do
    minimax(current_board)
  end

  def minimax(current_board) do
    cond do
      terminal?(current_board) ->
        terminal_cell(current_board)
    end
  end

  def terminal?(current_board) do
    current_board
    |> available_cells
    |> Enum.count == 1
  end

  def terminal_cell(current_board) do
    current_board
    |> available_cells
    |> Enum.max
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
