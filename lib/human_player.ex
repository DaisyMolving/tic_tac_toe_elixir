defmodule TicTacToe.HumanPlayer do

  defstruct name: "Player", marker: "x", score: 0

  def build(name, marker) do
    %TicTacToe.HumanPlayer{name: String.capitalize(name), marker: marker}
  end

  def update_score(updated_score) do
    %TicTacToe.HumanPlayer{score: updated_score}
  end

end
