defmodule TicTacToe.Game do
  alias TicTacToe.{Board, Player, ComputerPlayer, Validator, CliDisplay, Messager}
  
  def play_tic_tac_toe do
    welcome_players
    decide_game_type
  end

  def build_human_game do
    player_1 = build_human_player("Player 1", "x")
    player_2 = build_human_player("Player 2", "o")
    current_board = Board.create_new_board
    take_turn(current_board, {player_1, player_2})
  end

  def build_computer_game do
    player_1 = build_human_player("Human", "x")
    player_2 = %ComputerPlayer{}
    current_board = Board.create_new_board
    take_turn(current_board, {player_1, player_2})
  end

  def welcome_players do
    CliDisplay.write(Messager.welcome_introduction)
  end

  def decide_game_type do
    case game_type? do
      "a" ->
        build_human_game
      "b" ->
        build_computer_game
    end
  end

  def build_human_player(player_number, marker) do
      get_valid_input(Messager.name_input_request(player_number), :name)
      |> Player.build(marker)
  end

  def display_board(current_board) do
    current_board
    |> Messager.format_board
    |> CliDisplay.write
  end

  def take_turn(current_board, {player_1, player_2}) do
    if check_for_win_or_draw(current_board, player_2.name) == :continue do
      mark_board(current_board, {player_1, player_2})
    else
      decide_to_play_again
    end
  end

  def decide_to_play_again do
    if play_again? == "yes" do
      play_tic_tac_toe
    else
      :gameover
    end
  end

  defp game_type? do
    Messager.game_type_request
    |> get_valid_input(:game_type)
  end

  defp play_again? do
    Messager.play_again_input_request
    |> CliDisplay.get_stripped_input
  end

  defp mark_board(current_board, {player_1, player_2}) do
    display_board(current_board)
    chosen_cell = choose_cell(player_1)
    mark_cell_if_available(chosen_cell, current_board, {player_1, player_2})
  end

  defp check_for_win_or_draw(current_board, winning_player) do
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
  
  defp mark_cell_if_available(chosen_cell, current_board, {player_1, player_2}) do
    case Board.available_cell?(chosen_cell, current_board) do
      true ->
        chosen_cell
        |> Board.mark_cell(player_1.marker, current_board)
        |> take_turn({player_2, player_1})
      false ->
        take_turn(current_board, {player_1, player_2})
    end
  end

  defp choose_cell(player) do
    Messager.turn_input_request(player.name, player.marker)
    |> get_valid_input(:turn)
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
