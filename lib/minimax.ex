defmodule TicTacToe.Minimax do

  def best_move(current_board, current_marker) do
    Enum.map(available_cells(current_board), fn(cell) ->
      possible_board = ghost_mark(cell, current_marker, current_board)
      score = minimax(possible_board, opponent(current_marker), false)
      {score, cell}
    end) |> Enum.max |> elem(1)
  end

  def minimax(current_board, current_marker, maximising_player) do
    cond do
      terminal?(current_board) ->
        score(current_board, maximising_player)
      maximising_player ->
        Enum.map(possible_boards(current_board, current_marker), fn(possible_board) ->
          minimax(possible_board, opponent(current_marker), !maximising_player)
        end)
      |> Enum.max
      :else ->
        Enum.map(possible_boards(current_board, current_marker), fn(possible_board) ->
          minimax(possible_board, opponent(current_marker), !maximising_player)
        end)
      |> Enum.min
    end
  end

  def opponent("x"), do: "o"
  def opponent("o"), do: "x"

  def terminal?(current_board) do
    terminal_draw(current_board) or terminal_win(current_board)
  end

  def terminal_draw(current_board) do
    TicTacToe.Board.draw?(current_board)
  end

  def terminal_win(current_board) do
    TicTacToe.Board.win?(current_board)
  end

  def terminal_cell(current_board, current_marker) do
    current_board
    |> possible_boards(current_marker)
    |> evaluate(current_board)
    |> Enum.max
    |> elem(1)
  end

  def values(current_board, current_marker) do
    possible_boards(current_board, current_marker)
    |> evaluate(current_board)
  end

  def score(board, maximising_player) do
    cond do
      TicTacToe.Board.win?(board) and maximising_player ->
        -1
      TicTacToe.Board.win?(board) and !maximising_player ->
        1
      :else ->
        0
    end
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

  def available_cells(current_board) do
    Enum.filter(current_board, fn(cell) ->
      unmarked?(cell)
    end)
  end

  def unmarked?(cell) do
    String.match?(cell, ~r/^[1-9]$/)
  end

end
