defmodule TicTacToe.Validator do
  alias TicTacToe.Messager

  def validate_name(name_input) do
    run_validation(name_input, ~r/[a-z, A-Z]+/, Messager.name_input_failure)
  end

  def validate_marker(marker_input) do
    run_validation(marker_input, ~r/^(\D)$/, Messager.marker_input_failure)
  end

  def validate_turn(turn_input) do
    run_validation(turn_input, ~r/^([1-9])$/, Messager.turn_input_failure)
  end
  
  def validate_play_again(play_again_input) do
    run_validation(play_again_input, ~r/[yYnN]/, Messager.play_again_input_failure)
  end

  def run_validation(user_input, accepted_input, failure) do
    if String.match?(user_input, accepted_input) do
      {:ok, user_input}
    else
      {:error, failure}
    end
  end

end
