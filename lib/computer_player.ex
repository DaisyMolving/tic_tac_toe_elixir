defmodule TicTacToe.ComputerPlayer do

  defstruct name: "Computer", marker: "o"

  def choose_random_number do
    Integer.to_string(Enum.random(1..9))
  end
end
