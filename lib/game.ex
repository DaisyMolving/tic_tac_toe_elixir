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
      "Player 1" 
      |> Messager.name_input_request 
      |> CliDisplay.get_stripped_input 
      |> Validator.validate_input(:name) 
      |> Player.build("x")
    player_2 = 
      "Player 2" 
      |> Messager.name_input_request 
      |> CliDisplay.get_stripped_input 
      |> Validator.validate_input(:name) 
      |> Player.build("o")
    {player_1, player_2}
  end

end
