defmodule TicTacToe.Messager do

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

  def game_type_request do
    "Would you like to play a) a human vs human game or b) a human vs computer game?\n"
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
    "\nGameover.\nTo play again please type yes:\n"
  end

  def game_type_input_failure do
    "\nThat is not a valid response for game type. \nType an (a) for human vs human or a (b) for human vs computer:\n"
  end

  def name_input_failure do
    "\nThat is an invalid name.\n Please try again without using any non-letters: "
  end

  def marker_input_failure do
    "\nThat is an invalid marker.\n Choose a single character that is not a number: "
  end

  def turn_input_failure do
    "\nThat is not a valid turn.\n Please input a number corresponding to an unmarked space on the board: "
  end

end
