defmodule TicTacToe.Game do
  alias TicTacToe.{Board, Player, Display}

  def play_tic_tac_toe do
    new_board = Board.create_new_board
    welcome_to_game
    {player_1, player_2} = set_name_and_marker
    player_take_turn(player_1, player_2, new_board)
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
    cond do
      Board.available_cell?(current_board, mark_input) ->
        look_for_win_or_draw(player_1, player_2, Board.mark_cell(current_board, mark_input, player_1.marker))
      :else ->
        player_take_turn(player_1, player_2, current_board)
      end
  end

  def look_for_win_or_draw(player_1, player_2, current_board) do
    cond do
      Board.win?(current_board) ->
        Display.congratulate_winner(player_1.name)
      Board.draw?(current_board) ->
        Display.draw_message
      :else ->
        player_take_turn(player_2, player_1, current_board)
    end
  end

end
