defmodule Mix.Tasks.Play do
  use Mix.Task
  import TicTacToe.Game

  def run(_) do
    play_tic_tac_toe
  end

end
