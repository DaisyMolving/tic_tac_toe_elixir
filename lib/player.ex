defmodule TicTacToe.Player do

  defstruct name: "Player", marker: "x"

  def name(given_name) do
    %TicTacToe.Player{name: String.capitalize(given_name)}
  end

  def marker(given_marker) do
    %TicTacToe.Player{marker: given_marker}
  end

end
