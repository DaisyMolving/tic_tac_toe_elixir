defmodule TicTacToe.ComputerPlayer do

  defstruct name: "Computer", marker: "o", colour: "\e[33m"

  def build(name, marker) do
    %TicTacToe.HumanPlayer{name: name, marker: marker}
  end

end

