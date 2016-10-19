defmodule TicTacToe.CliDisplay do

  def write(message) do
    IO.write(message)
  end

  def get_stripped_input(message) do
    message
    |> IO.gets
    |> String.strip
  end

end
