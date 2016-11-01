defmodule TicTacToe.HumanPlayer do

  defstruct name: "Player", marker: "x", colour: "\e[36m"

  def build(name, marker) do
    %TicTacToe.HumanPlayer{name: String.capitalize(name), marker: marker}
  end

end
