defmodule TicTacToe.Game do
  alias TicTacToe.{Board, Player, Validator, CliDisplay, Messager}
  
  def play_tic_tac_toe do
    welcome_players
    {player_1, player_2} = build_players
    current_board = Board.create_new_board
    take_turn(current_board, {player_1, player_2})
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

  def take_turn(current_board, {player_1, player_2}) do
    if check_for_win_or_draw(current_board, player_2.name) == :continue do
      display_board(current_board)
      chosen_cell = choose_cell(player_1)
      mark_cell_if_available(chosen_cell, current_board, {player_1, player_2})
    else
      :gameover
    end
  end

  def check_for_win_or_draw(current_board, winning_player) do
    cond do
      Board.win?(current_board) ->
        winning_player
        |> Messager.congratulate_winner
        |> CliDisplay.write
      Board.draw?(current_board) ->
        Messager.draw_message
        |> CliDisplay.write
      :else ->
        :continue
    end
  end
  
  def mark_cell_if_available(chosen_cell, current_board, {player_1, player_2}) do
    case Board.available_cell?(chosen_cell, current_board) do
      true ->
        chosen_cell
        |> Board.mark_cell(player_1.marker, current_board)
        |> take_turn({player_2, player_1})
      false ->
        take_turn(current_board, {player_1, player_2})
    end
  end

  def choose_cell(player) do
    Messager.turn_input_request(player.name, player.marker)
    |> get_valid_input(:turn)
  end

  def display_board(current_board) do
    CliDisplay.write(Messager.format_board(current_board))
  end

  defp get_valid_input(request, category) do
    request
    |> CliDisplay.get_stripped_input 
    |> Validator.validate_input(category) 
    |> respond_to_validation(category)
  end

  defp respond_to_validation({status, response}, category) do
    case status do
      :ok ->
        response
      :error ->
        get_valid_input(response, category)
    end
  end

end
