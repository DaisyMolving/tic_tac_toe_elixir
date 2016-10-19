defmodule TicTacToe.Game do
  alias TicTacToe.{Board, Player, Messager}

  def play_tic_tac_toe do
    new_board = Board.create_new_board
    welcome_to_game
    {player_1, player_2} = set_name_and_marker
    player_take_turn(player_1, player_2, new_board)
    decide_to_play_again(Messager.validate_play_again(Messager.play_again_input_request))
  end

  def welcome_to_game do
    Messager.welcome_introduction
  end

  def set_name_and_marker do
    player_1 = Player.build(Messager.validate_name(Messager.name_input_request("Player 1")), "x")
    player_2 = Player.build(Messager.validate_name(Messager.name_input_request("Player 2")), "o")
    {player_1, player_2}
  end

  def player_take_turn(player_1, player_2, current_board) do
    display_board(current_board)
    mark_input = Messager.validate_turn(Messager.turn_input_request(player_1.name, player_1.marker))
    if Board.available_cell?(current_board, mark_input) do
      look_for_win_or_draw(player_1, player_2, Board.mark_cell(current_board, mark_input, player_1.marker))
    else
      Messager.unavailable_cell
      player_take_turn(player_1, player_2, current_board)
    end
  end

  def look_for_win_or_draw(player_1, player_2, current_board) do
    cond do
      Board.win?(current_board) ->
        Messager.congratulate_winner(player_1.name)
        display_board(current_board)
      Board.draw?(current_board) ->
        Messager.draw_message
        display_board(current_board)
      :else ->
        player_take_turn(player_2, player_1, current_board)
    end
  end

  def decide_to_play_again(play_again_decision) do
    case play_again_decision do
      "y" ->
        play_tic_tac_toe
      "Y" ->
        play_tic_tac_toe
      _ -> 
        :gameover
    end
  end

  def display_board(current_board) do
    Messager.format_board(current_board)
    |> IO.puts
  end
end
