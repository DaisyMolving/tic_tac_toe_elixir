defmodule TicTacToe.Display do

  def ask_to_play_or_end(user_input) do
    cond do
      String.match?(user_input, ~r/([^q, Q])/) ->
        :continue
      :else ->
        farewell_message
      end
  end

  def ask_for_name(player_number) do
    input = request_set_player_name(player_number)
    cond do
      String.match?(input, ~r/[a-z, A-Z]+/) ->
        input
      :else ->
        invalid_input
        ask_for_name(player_number)
      end
  end

  def ask_for_marker(player_name) do
    cond do
      String.match?(request_set_player_marker(player_name), ~r/^(\D)$/) ->
        :set_marker
      :else ->
        invalid_input
        ask_for_marker(player_name)
      end
  end

  def ask_for_turn(player_name) do
    input = request_turn(player_name)
    cond do
      String.match?(input, ~r/[1-9]/) ->
        input
      :else ->
        invalid_input
        ask_for_turn(player_name)
      end
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

  def welcome_introduction do
    get_stripped_input("Welcome to TicTacToe! To play, press any key to continue, or q to quit: ")
  end

  defp farewell_message do
    IO.puts("Goodbye")
  end

  defp request_set_player_name(player_number) do
    get_stripped_input("Player #{player_number}, please input your name: ")
  end

  defp request_set_player_marker(player_name) do
    get_stripped_input("#{player_name}, please choose a marker of any single character that is not a number. ")
  end

  defp invalid_input do
    IO.write("Sorry, that is not a valid input. ")
  end

  defp request_turn(player_name) do
    get_stripped_input("#{player_name}'s turn, input the number of the position that you would like to mark: ")
  end

  defp get_stripped_input(output_message) do
    String.strip(IO.gets(output_message))
  end

end
