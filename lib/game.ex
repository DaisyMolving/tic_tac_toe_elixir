defmodule TicTacToe.Game do
  alias TicTacToe.{Player, Validator, CliDisplay, Messager}

  def play_tic_tac_toe do
    welcome_players
    {player_1, player_2} = build_players
  end

  def welcome_players do
    CliDisplay.write(Messager.welcome_introduction)
  end

  def build_players do
    player_1 = 
      get_valid_input(Messager.name_input_request("Player 1"), :name)
      |> Player.build("x")
    player_2 = 
      get_valid_input(Messager.name_input_request("Player 2"), :name)
      |> Player.build("o")
    {player_1, player_2}
  end

  def get_valid_input(request, category) do
    request
    |> CliDisplay.get_stripped_input 
    |> Validator.validate_input(category) 
    |> respond_to_validation(category)
  end

  def respond_to_validation({status, response}, category) do
    case status do
      :ok ->
        response
      :error ->
        get_valid_input(response, category)
    end
  end

  def display_board(current_board) do
    CliDisplay.write(Messager.format_board(current_board))
  end

end
