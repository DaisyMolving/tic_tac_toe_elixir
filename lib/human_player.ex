defmodule TicTacToe.HumanPlayer do

  defstruct name: "Player", marker: "x"

  def build(name, marker) do
    %TicTacToe.HumanPlayer{name: String.capitalize(name), marker: marker}
  end

end
