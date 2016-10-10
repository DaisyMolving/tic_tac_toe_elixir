defmodule TicTacToe.Display do

  @user_input_request %{
    :name  => ", please input your name: ",
    :marker => ", please choose a marker of any single character that is not a number. ",
    :turn => "'s turn, input the number of the position that you would like to mark: "
  }

  @accepted_input %{
    :name => ~r/[a-z, A-Z]+/,
    :marker => ~r/^(\D)$/,
    :turn => ~r/[1-9]/
  }

  @failure_instruction %{
    :name => "That is an invalid name.\n Please try again without using any non-letters: ",
    :marker => "That is an invalid marker.\n Choose a single character that is not a number: ",
    :turn => "That is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "
  }

  def request_to_validate(request_category, player_identifier) do
    get_stripped_input(player_identifier <> @user_input_request[request_category])
    |> run_validation(@accepted_input[request_category], @failure_instruction[request_category])
  end

  def run_validation(user_input, accepted_input, failure) do
    cond do
      String.match?(user_input, accepted_input) ->
        user_input
      :else ->
        run_validation(get_stripped_input(failure), accepted_input, failure)
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
    IO.puts("\n\nWelcome to Tic Tac Toe, a two player strategy game.\n")
  end

  defp get_stripped_input(output_message) do
    String.strip(IO.gets(output_message))
  end

end
