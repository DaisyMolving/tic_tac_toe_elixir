defmodule TicTacToe.ComputerPlayer do

  defstruct name: "Computer", marker: "o"

  def return_possible_boards(current_board, marker) do
    return_possible_boards([], current_board, current_board, marker)
  end

  def return_possible_boards(possible_boards, [], _board, _marker), do: possible_boards
  def return_possible_boards(possible_boards, [head | tail], current_board, marker) do
    if unmarked?(head) do
      List.insert_at(possible_boards, -1, ghost_mark(head, marker, current_board))
      |> return_possible_boards(tail, current_board, marker)
    else
      return_possible_boards(possible_boards, tail, current_board, marker)
    end
  end

  defp unmarked?(cell) do
    String.match?(cell, ~r/[1-9]/)
  end

  defp ghost_mark(cell, marker, current_board) do
    List.replace_at(current_board, String.to_integer(cell) - 1, marker) 
  end
end
