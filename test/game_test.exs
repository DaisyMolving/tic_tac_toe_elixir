defmodule TicTacToeTest.Game do
  use ExUnit.Case
  
  test "player can decide not to play again" do
    assert TicTacToe.Game.decide_to_play_again("n") == :gameover
    assert TicTacToe.Game.decide_to_play_again("N") == :gameover
    assert TicTacToe.Game.decide_to_play_again("9") == :gameover
  end

end
