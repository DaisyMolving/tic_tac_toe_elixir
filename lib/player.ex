defmodule TicTacToe.Player do

  defstruct name: "Player", marker: "x"

  def name(given_name) do
    String.capitalize(given_name)
  end

  def marker(given_marker) do
    given_marker
  end

end
