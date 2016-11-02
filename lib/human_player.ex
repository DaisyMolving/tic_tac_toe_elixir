defmodule TicTacToe.HumanPlayer do

  defstruct name: "Player", marker: "x", score: 0

  def build(name, marker) do
    %TicTacToe.HumanPlayer{name: String.capitalize(name), marker: marker}
  end

  def update_score(name, marker, updated_score) do
    %TicTacToe.HumanPlayer{name: name, marker: marker, score: updated_score}
  end

end
