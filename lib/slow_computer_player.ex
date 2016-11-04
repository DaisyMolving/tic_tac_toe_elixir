defmodule TicTacToe.SlowComputerPlayer do

  defstruct name: "Computer", marker: "o", score: 0

  def build(name, marker) do
    %TicTacToe.SlowComputerPlayer{name: name, marker: marker}
  end

  def move(current_board, {player_1, player_2}) do
    :timer.sleep(1000)
    TicTacToe.Minimax.best_move(current_board, {player_1, player_2})
  end

  def update_score(player) do
    %TicTacToe.SlowComputerPlayer{name: player.name, marker: player.marker, score: player.score + 1}
  end

end
