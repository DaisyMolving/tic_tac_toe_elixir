defmodule TicTacToe.Game do

  def play_tic_tac_toe do
    display = TicTacToe.Display
    board = TicTacToe.Board
    player = TicTacToe.Player
    start_new_game(display, board, player, player)
  end

  def start_new_game(display, board, player_1, player_2) do
    new_board = board.create_new_board
    cond do
      decide_to_play(display) == :continue ->
        set_name_and_marker(display, player_1, player_2, board, new_board)
      :else ->
        :game_ended
      end
  end

  def decide_to_play(display) do
    display.ask_to_play_or_end
  end

  def set_name_and_marker(display, player_1, player_2, board, current_board) do
    player_1 = player_1.set_name_and_marker(display.ask_for_name("1"), "x") 
    player_2 = player_2.set_name_and_marker(display.ask_for_name("2"), "o")
    player_take_turn(player_1, player_2, display, board, current_board)
  end

  def player_take_turn(player_1, player_2, display, board, current_board) do
    display.display_board(current_board)
    mark_input = display.ask_for_turn(player_1.name)
    cond do
      board.available_cell?(current_board, mark_input) ->
        look_for_winner(player_1, player_2, display, board, board.mark_cell(current_board, mark_input, player_1.marker))
      :else ->
        player_take_turn(player_1, player_2, display, board, current_board)
      end
  end

  def look_for_winner(player_1, player_2, display, board, current_board) do
    cond do
      board.win?(current_board) ->
        display.congratulate_winner(player_1.name)
      :else ->
        player_take_turn(player_2, player_1, display, board, current_board)
    end
  end

end
