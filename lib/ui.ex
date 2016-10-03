defmodule TicTacToe.UI do

  def welcome_introduction do
    "Welcome to TicTacToe! This is a two player strategy game. Press q to quit, or any other key to continue: "
  end

  def request_set_player_name(player_number) do
    "Player #{player_number}, please input your name: "
  end

  def request_set_player_marker(player_name) do
    "Thank you #{player_name}, now please choose a marker (this can be any single symbol that is not a number): "
  end
  
  def invalid_marker_message(player_name) do
    "Sorry #{player_name}, that is not a valid marker. Please choose a single symbol that is NOT a number: "
  end

  def display_board(current_board) do
    Enum.chunk(current_board, 3)
    |> Enum.map(fn(row) ->
      Enum.join(row, " ")
    end)
    |> Enum.join("\n")
  end

end
