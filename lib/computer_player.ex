defmodule TicTacToe.ComputerPlayer do

  defstruct name: "Computer", marker: "o", score: 0

  def build(name, marker) do
    %TicTacToe.HumanPlayer{name: name, marker: marker}
  end

  def computer_move(current_board, {player_1, player_2}) do
    System.cmd("sleep", ["1"])
    TicTacToe.Minimax.best_move(current_board, {player_1, player_2})
  end

end

