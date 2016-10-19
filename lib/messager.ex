defmodule TicTacToe.Messager do
  
  def validate_name(name_input) do
    run_validation(name_input, ~r/[a-z, A-Z]+/, name_input_failure)
  end

  def validate_marker(marker_input) do
    run_validation(marker_input, ~r/^(\D)$/, marker_input_failure)
  end

  def validate_turn(turn_input) do
    run_validation(turn_input, ~r/^([1-9])$/, turn_input_failure)
  end
  
  def validate_play_again(play_again_input) do
    run_validation(play_again_input, ~r/[yYnN]/, play_again_input_failure)
  end

  def run_validation(user_input, accepted_input, failure) do
    if String.match?(user_input, accepted_input) do
      user_input
    else
      run_validation(get_stripped_input(failure), accepted_input, failure)
    end
  end

  def format_board(current_board) do
    Enum.chunk(current_board, 3)
    |> Enum.map(fn(row) ->
      Enum.join(row, " ")
    end)
    |> Enum.join("\n")
    |> String.pad_leading(20, "\n")
  end

  def welcome_introduction do
    "\n\nWelcome to Tic Tac Toe, a two player strategy game.\n"
  end

  def name_input_request(player_number) do
    "\nWelcome #{player_number}, please input your name: \n"
  end

  def marker_input_request(player_name) do
    "\n#{player_name}, please choose a marker of any single character that is not a number: \n"
  end

  def turn_input_request(player_name, marker) do
    "\nIt's #{player_name}'s turn with the marker #{marker}, \ninput the number of the position that you would like to mark: \n"
  end

  def unavailable_cell do
    "\nUh Oh! That position is unavailable! Please try again:\n"
  end
  
  def draw_message do
    "\nIt's a draw!\n"
  end

  def congratulate_winner(winning_player) do
    "\n#{winning_player} won! Congratulations!\n"
  end

  def play_again_input_request do
    "\nPlayers, would you like to play again? Type y or n:"
  end

  defp name_input_failure do
    "\nThat is an invalid name.\n Please try again without using any non-letters: "
  end

  defp marker_input_failure do
    "\nThat is an invalid marker.\n Choose a single character that is not a number: "
  end

  defp turn_input_failure do
    "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "
  end

  defp play_again_input_failure do
    "\nThat is not a valid answer, please type y for yes or n for no: " 
  end

  def get_stripped_input(output_message) do
    String.strip(IO.gets(output_message))
  end

end
