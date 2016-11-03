defmodule TicTacToe.ComputerPlayer do

  defstruct name: "Computer", marker: "o", score: 0

  def build(name, marker) do
    %TicTacToe.HumanPlayer{name: name, marker: marker}
  end

  def computer_move(current_board, {player_1, player_2}) do
    :timer.sleep(1000)
    TicTacToe.Minimax.best_move(current_board, {player_1, player_2})
  end

  def update_score(name, marker, updated_score) do
    %TicTacToe.HumanPlayer{name: name, marker: marker, score: updated_score}
  end

end

