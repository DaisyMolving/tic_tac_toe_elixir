defmodule TicTacToe.Player do

  defstruct name: "Player", marker: "x"

  def set_name_and_marker(given_name, given_marker) do
    %TicTacToe.Player{name: String.capitalize(given_name), marker: given_marker}
  end
end
