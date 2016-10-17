defmodule TicTacToe.Display do

  @user_input_request %{
    :name  => "\nWelcome player_identifier, please input your name: \n",
    :marker => "\nplayer_identifier, please choose a marker of any single character that is not a number: \n",
    :turn => "\nIt's player_identifier's turn, \ninput the number of the position that you would like to mark: \n",
    :play_again => "\nplayer_identifier, would you like to play again? Type y or n:"
  }

  @accepted_input %{
    :name => ~r/[a-z, A-Z]+/,
    :marker => ~r/^(\D)$/,
    :turn => ~r/^([1-9])$/,
    :play_again => ~r/[yYnN]/
  }

  @failure_instruction %{
    :name => "\nThat is an invalid name.\n Please try again without using any non-letters: ",
    :marker => "\nThat is an invalid marker.\n Choose a single character that is not a number: ",
    :turn => "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: ",
    :play_again => "\nThat is not a valid answer, please type y for yes or n for no: "
  }

  def validate_name(player_identifier) do
    run_validation(name_input_request(player_identifier), ~r/[a-z, A-Z]+/, name_input_failure)
  end

  def request_to_validate(request_category, player_identifier) do
    @user_input_request[request_category]
    |> String.replace("player_identifier", player_identifier)
    |> get_stripped_input
    |> run_validation(@accepted_input[request_category], @failure_instruction[request_category])
  end

  def run_validation(user_input, accepted_input, failure) do
    if String.match?(user_input, accepted_input) do
      user_input
    else
      run_validation(get_stripped_input(failure), accepted_input, failure)
    end
  end

  def display_board(current_board) do
    Enum.chunk(current_board, 3)
    |> Enum.map(fn(row) ->
      Enum.join(row, " ")
    end)
    |> Enum.join("\n")
    |> String.pad_leading(20, "\n")
    |> IO.puts
  end

  def draw_message do
    IO.puts("\nIt's a draw!\n")
  end

  def congratulate_winner(winning_player) do
    IO.puts("\n#{winning_player} won! Congratulations!\n")
  end

  def welcome_introduction do
    IO.puts("\n\nWelcome to Tic Tac Toe, a two player strategy game.\n")
  end

  def unavailable_cell do
    IO.puts("\nUh Oh! That position is unavailable! Please try again.\n")
  end
  
  defp name_input_request(player_number) do
    "\nWelcome Player 1, please input your name: \n"
  end

  defp name_input_failure do
    "\nThat is an invalid name.\n Please try again without using any non-letters: "
  end

  defp get_stripped_input(output_message) do
    String.strip(IO.gets(output_message))
  end

end
