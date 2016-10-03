defmodule TicTacToe.UI do

  def welcome_introduction do
    "Welcome to TicTacToe! This is a two player strategy game. Press q to quit, or any other key to continue: "
  end

  def display_board(current_board) do
    Enum.chunk(current_board, 3)
    |> Enum.map(fn(row) ->
      Enum.join(row, " ")
    end)
    |> Enum.join("\n")
  end

end
