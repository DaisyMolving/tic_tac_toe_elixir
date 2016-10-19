defmodule TicTacToe.Player do

  defstruct name: "Player", marker: "x"

  def build(name, marker) do
    %TicTacToe.Player{name: String.capitalize(elem(name, 1)), marker: marker}
  end
end
