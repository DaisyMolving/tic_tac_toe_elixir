defmodule TicTacToe.HumanPlayer do

  defstruct name: "Player", marker: "x", score: 0

  def build(name, marker) do
    %TicTacToe.HumanPlayer{name: String.capitalize(name), marker: marker}
  end

  def update_score(player) do
    %TicTacToe.HumanPlayer{name: player.name, marker: player.marker, score: player.score + 1}
  end

end
