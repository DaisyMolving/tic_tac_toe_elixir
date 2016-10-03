defmodule TicTacToeTest.PrinterReceiver do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "prints to the command line" do
    assert capture_io(fn ->
      TicTacToe.PrinterReceiver.print_message("hello")
    end) =~ "hello"
  end

  test "receives input from the command line" do
    assert capture_io("hi", fn ->
      IO.write TicTacToe.PrinterReceiver.receive_user_input("say hi: ")
    end) =~ "say hi: hi"
  end
end
