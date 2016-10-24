defmodule TicTacToe.Game do
  alias TicTacToe.{Board, HumanPlayer, ComputerPlayer, Validator, CliDisplay, Messager}

  def play_tic_tac_toe do
    welcome_players
    {player_1, player_2} = decide_game_type
    current_board = Board.create_new_board
    take_turn(current_board, decide_starter({player_1, player_2}))
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

  def decide_starter({player_1, player_2}) do
    case starter?(player_1, player_2) do
      "a" ->
        {player_1, player_2}
      "b" ->
        {player_2, player_1}
    end
  end

  def build_human_game do
    player_1 = build_human_player("Player 1", "x")
    player_2 = build_human_player("Player 2", "o")
    {player_1, player_2}
  end

  def build_computer_game do
    player_1 = build_human_player("Human", "x")
    player_2 = %ComputerPlayer{}
    {player_1, player_2}
  end

  def build_human_player(player_number, marker) do
    Messager.name_input_request(player_number)
    |> CliDisplay.get_stripped_input 
    |> get_valid_input(:name)
    |> HumanPlayer.build(marker)
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
    |> CliDisplay.get_stripped_input
    |> get_valid_input(:game_type)
  end

  defp starter?(player_1, player_2) do
    Messager.starter_request(player_1.name, player_2.name)
    |> CliDisplay.get_stripped_input
    |> get_valid_input(:starter)
  end

  defp play_again? do
    Messager.play_again_input_request
    |> CliDisplay.get_stripped_input
  end

  defp mark_board(current_board, {player_1, player_2}) do
    display_board(current_board)
    if player_1.name == "Computer" do
      computer_choose_cell(player_1)
      |> mark_cell_if_available(current_board, {player_1, player_2})
    else
      human_choose_cell(player_1)
      |> mark_cell_if_available(current_board, {player_1, player_2})
    end
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

  defp human_choose_cell(player) do
    Messager.turn_input_request(player.name, player.marker)
    |> CliDisplay.get_stripped_input
    |> get_valid_input(:turn)
  end

  defp computer_choose_cell(player) do
    Messager.turn_input_request(player.name, player.marker)
    |> CliDisplay.write
    ComputerPlayer.choose_random_number
    |> get_valid_input(:turn)
  end

  defp get_valid_input(request, category) do
    request
    |> Validator.validate_input(category)
    |> respond_to_validation(category)
  end

  defp respond_to_validation({:ok, response}, _category), do: response
  defp respond_to_validation({:error, response}, category) do
      response
      |> CliDisplay.get_stripped_input
      |> get_valid_input(category)
  end

end
