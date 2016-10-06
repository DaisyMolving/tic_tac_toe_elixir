defmodule TicTacToeTest.Game do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "given all possible inputs, someone wins" do
    assert capture_io([input: "go\n12\n!@£\nGary\nBarry\n@\n1\n4\n2\n2\n5\n3\n", capture_prompt: false], fn ->
      TicTacToe.Game.play_tic_tac_toe
    end) =~ "Gary won!"
  end

  # test "given all possible inputs, " do
  #   assert capture_io([input: "go\n12\n!@£\nGary\nBarry\n@\n1\n6\n5\n9\n3\n7\n8\n\n2\n4\n", capture_prompt: false], fn ->
  #     TicTacToe.Game.play_tic_tac_toe
  #   end) =~ "It's a draw!"
  # end

end
