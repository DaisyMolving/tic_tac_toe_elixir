defmodule TicTacToeTest.CliDisplay do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "displays a message on the CLI" do
    assert capture_io(fn ->
      TicTacToe.CliDisplay.write("hello")
    end) == "hello"
  end

  test "returns a stripped string from input" do
    assert capture_io([input: "Daisy", capture_prompt: false], fn ->
      IO.write TicTacToe.CliDisplay.get_stripped_input("What is your name?")
    end) == "Daisy"
  end

end
