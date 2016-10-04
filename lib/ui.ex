defmodule TicTacToe.UI do

  @user_input_requests [
    {:start_or_quit, &TicTacToe.UI.welcome_introduction/0},
    {:name_input, &TicTacToe.UI.request_set_player_name/1},
    {:marker_input, &TicTacToe.UI.request_set_player_marker/1},
    {:player_turn, &TicTacToe.UI.turn_message/1}
  ]

  @validation_matches [
    {:start_or_quit, ~r/([^q, Q])/},
    {:name_input, ~r/(\w+)/},
    {:marker_input, ~r/(\D)/},
    {:player_turn, ~r/([1-9])/}
  ]

  @invalid_input_messages [
    {:start_or_quit, :end_game},
    {:name_input, &TicTacToe.UI.invalid_name/1},
    {:marker_input, &TicTacToe.UI.invalid_marker/1},
    {:player_turn, &TicTacToe.UI.invalid_turn/1}
  ]

  
 def welcome_introduction do
    "Welcome to TicTacToe! This is a two player strategy game. Press q to quit, or any other key to continue: "
  end

  def request_set_player_name(player_number) do
    "Player #{player_number}, please input your name: "
  end

  def request_set_player_marker(player_name) do
    "Thank you #{player_name}, now please choose a marker (this can be any single symbol that is not a number): "
  end
  
  def invalid_name(player_number) do
    "Sorry player #{player_number}, that is not a valid player name. Please choose a single word with no numbers: "
  end

  def invalid_marker(player_name) do
    "Sorry #{player_name}, that is not a valid marker. Please choose a single symbol that is NOT a number: "
  end

  def invalid_turn(player_name) do
    "Sorry #{player_name}, that is not a valid turn. Please choose a number from 1 - 9 that matches a position that is not already taken: "
  end

  def turn_message(player_name) do
    "It's #{player_name}'s turn, input the number of the position that you would like to mark: "
  end

  def display_board(current_board) do
    Enum.chunk(current_board, 3)
    |> Enum.map(fn(row) ->
      Enum.join(row, " ")
    end)
    |> Enum.join("\n")
  end

  def invalid_input do
    "That is an invalid input, please try again: "
  end

  def draw_message do
    "It's a draw!"
  end

  def congratulate_winner(winning_player) do
    "#{winning_player} won! Congratulations!"
  end

end
