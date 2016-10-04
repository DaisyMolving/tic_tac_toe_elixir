defmodule TicTacToe.UI do
  
  def welcome_introduction do
    get_stripped_input("Welcome to TicTacToe! This is a two player strategy game. Press q to quit, or any other key to continue: ")
  end

  def farewell_message do
    IO.puts("Goodbye")
  end

  def request_set_player_name(player_number) do
    get_stripped_input("Player #{player_number}, please input your name: ")
  end

  def request_set_player_marker(player_name) do
    get_stripped_input("Thank you #{player_name}, now please choose a marker (this can be any single symbol that is not a number): ")
  end
  
  def invalid_name(player_number) do
    get_stripped_input("Sorry player #{player_number}, that is not a valid player name. Please choose a single word with no numbers: ")
  end

  def invalid_marker(player_name) do
    get_stripped_input("Sorry #{player_name}, that is not a valid marker. Please choose a single symbol that is NOT a number: ")
  end

  def invalid_turn(player_name) do
    get_stripped_input("Sorry #{player_name}, that is not a valid turn. Please choose a number from 1 - 9 that matches a position that is not already taken: ")
  end

  def turn_message(player_name) do
    get_stripped_input("It's #{player_name}'s turn, input the number of the position that you would like to mark: ")
  end

  def display_board(current_board) do
    Enum.chunk(current_board, 3)
    |> Enum.map(fn(row) ->
      Enum.join(row, " ")
    end)
    |> Enum.join("\n")
    |> IO.puts
  end

  def draw_message do
    IO.puts("It's a draw!")
  end

  def congratulate_winner(winning_player) do
    IO.puts("#{winning_player} won! Congratulations!")
  end

  defp get_stripped_input(output_message) do
    String.strip(IO.gets(output_message))
  end
end
