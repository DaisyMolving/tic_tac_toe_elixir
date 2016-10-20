defmodule TicTacToe.Player do

  defstruct name: "Player", marker: "x"

  def build(name, marker) do
    %TicTacToe.Player{name: String.capitalize(name), marker: marker}
  end

end
