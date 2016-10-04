defmodule TicTacToe.PrinterReceiver do

  def print(output_message) do
    IO.puts(output_message)
  end

  def receive_user_input(output_message) do
    IO.gets(output_message)
  end
end
