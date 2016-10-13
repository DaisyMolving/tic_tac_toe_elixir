defmodule TicTacToe.Game do
  alias TicTacToe.{Board, Player, Display}

  def play_tic_tac_toe do
    new_board = Board.create_new_board
    welcome_to_game
    {player_1, player_2} = set_name_and_marker
    player_take_turn(player_1, player_2, new_board)
    decide_to_play_again
  end

  def welcome_to_game do
    Display.welcome_introduction
  end

  def set_name_and_marker do
    player_1 = Player.set_name_and_marker(Display.request_to_validate(:name, "Player 1"), "x")
    player_2 = Player.set_name_and_marker(Display.request_to_validate(:name, "Player 2"), "o")
    {player_1, player_2}
  end

  def player_take_turn(player_1, player_2, current_board) do
    Display.display_board(current_board)
    mark_input = Display.request_to_validate(:turn, player_1.name)
    if Board.available_cell?(current_board, mark_input) do
      look_for_win_or_draw(player_1, player_2, Board.mark_cell(current_board, mark_input, player_1.marker))
    else
      Display.unavailable_cell
      player_take_turn(player_1, player_2, current_board)
    end
  end

  def look_for_win_or_draw(player_1, player_2, current_board) do
    cond do
      Board.win?(current_board) ->
        Display.congratulate_winner(player_1.name)
        Display.display_board(current_board)
      Board.draw?(current_board) ->
        Display.draw_message
        Display.display_board(current_board)
      :else ->
        player_take_turn(player_2, player_1, current_board)
    end
  end

  def decide_to_play_again do
    case Display.request_to_validate(:play_again, "Players") do
      "y" ->
        play_tic_tac_toe
      "Y" ->
        play_tic_tac_toe
      _ -> 
        :gameover
    end
  end

end
