defmodule TicTacToe.Game do
  alias TicTacToe.{Board, HumanPlayer, ComputerPlayer, Validator, CliDisplay, Messager}

  def play_tic_tac_toe do
    start_new_game(%{})
  end

  def start_new_game(player_scores) do
    welcome_players
    {player_1, player_2} = decide_game_type
    current_board = Board.create_new_board
    player_scores = add_player_scores(player_scores, player_1, player_2)
    take_turn(current_board, {player_1, player_2}, player_scores)
  end

  def add_player_scores(player_scores, player_1, player_2) do
    cond do
      !Map.has_key?(player_scores, player_1.name) ->
        player_scores = Map.put(player_scores, player_1.name, 0)
        add_player_scores(player_scores, player_2, player_1)
      !Map.has_key?(player_scores, player_2.name) ->
        player_scores = Map.put(player_scores, player_2.name, 0)
        add_player_scores(player_scores, player_2, player_1)
      :else ->
        player_scores
    end
  end

  def decide_to_play_again(player_scores) do
    if play_again? == "yes" do
      welcome_players
      start_new_game(player_scores)
    else
      state_final_score(player_scores)
      :gameover
    end
  end

  def welcome_players do
    CliDisplay.write(Messager.welcome_introduction)
  end

  def decide_game_type do
    case game_type? do
      "a" ->
        build_human_human_game
      "b" ->
        build_human_computer_game
      "c" ->
        build_computer_human_game
      "d" ->
        build_computer_computer_game
    end
  end

  def build_human_human_game do
    player_1 = build_human_player("Player 1", "\e[36mx\e[0m")
    player_2 = build_human_player("Player 2", "\e[33mo\e[0m")
    {player_1, player_2}
  end

  def build_human_computer_game do
    player_1 = build_human_player("Human", "\e[36mx\e[0m")
    player_2 = ComputerPlayer.build("Computer", "\e[33mo\e[0m")
    {player_1, player_2}
  end

  def build_computer_human_game do
    player_1 = ComputerPlayer.build("Computer", "\e[33mo\e[0m")
    player_2 = build_human_player("Human", "\e[36mx\e[0m")
    {player_1, player_2}
  end

  def build_computer_computer_game do
    player_1 = ComputerPlayer.build("Computer 1", "\e[36mx\e[0m")
    player_2 = ComputerPlayer.build("Computer 2", "\e[33mo\e[0m")
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

  def take_turn(current_board, {player_1, player_2}, player_scores) do
    case check_for_win_or_draw(current_board, player_2.name) do
      :continue ->
        mark_board(current_board, {player_1, player_2}, player_scores)
      :winner ->
        update_player_score(player_scores, player_2)
        |> decide_to_play_again
      :draw ->
        decide_to_play_again(player_scores)
    end
  end

  def update_player_score(player_scores, winning_player) do
    Map.update(player_scores, winning_player.name, 1, &(&1 + 1))
  end

  def state_final_score(player_scores) do
    Enum.each(player_scores, fn{player, score} ->
      CliDisplay.write("#{player}: #{score}")
    end)
  end

  defp game_type? do
    Messager.game_type_request
    |> CliDisplay.get_stripped_input
    |> get_valid_input(:game_type)
  end

  defp play_again? do
    Messager.play_again_input_request
    |> CliDisplay.get_stripped_input
  end

  defp mark_board(current_board, {player_1, player_2}, player_scores) do
    display_board(current_board)
    if player_1.name =~ "Computer" do
      Messager.turn_input_request(player_1.name, player_1.marker)
      |> CliDisplay.write
      computer_mark_cell(current_board, {player_1, player_2}, player_scores)
    else
      human_choose_cell(player_1)
      |> mark_cell_if_available(current_board, {player_1, player_2}, player_scores)
    end
  end

  def computer_mark_cell(current_board, {player_1, player_2}, player_scores) do
    ComputerPlayer.computer_move(current_board, {player_1, player_2})
    |> Board.mark_cell(player_1.marker, current_board)
    |> take_turn({player_2, player_1}, player_scores)
  end

  defp check_for_win_or_draw(current_board, winning_player) do
    cond do
      Board.win?(current_board) ->
        winning_player
        |> Messager.congratulate_winner
        |> CliDisplay.write
        display_board(current_board)
        :winner
      Board.draw?(current_board) ->
        Messager.draw_message
        |> CliDisplay.write
        display_board(current_board)
        :draw
      :else ->
        :continue
    end
  end


  defp mark_cell_if_available(chosen_cell, current_board, {player_1, player_2}, player_scores) do
    case Board.available_cell?(chosen_cell, current_board) do
      true ->
        chosen_cell
        |> Board.mark_cell(player_1.marker, current_board)
        |> take_turn({player_2, player_1}, player_scores)
      false ->
        take_turn(current_board, {player_1, player_2}, player_scores)
    end
  end

  defp human_choose_cell(player) do
    Messager.turn_input_request(player.name, player.marker)
    |> CliDisplay.get_stripped_input
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
