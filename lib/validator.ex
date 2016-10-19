defmodule TicTacToe.Validator do
  alias TicTacToe.Messager

  @match_and_failure %{
    :name => {~r/[a-z, A-Z]+/, Messager.name_input_failure},
    :marker => {~r/^(\D)$/, Messager.marker_input_failure},
    :turn => {~r/^([1-9])$/, Messager.turn_input_failure},
    :play_again => {~r/[yYnN]/, Messager.play_again_input_failure}
  }

  def validate_name(name_input) do
    run_validation(name_input, @match_and_failure[:name])
  end

  def validate_marker(marker_input) do
    run_validation(marker_input, @match_and_failure[:marker])
  end

  def validate_turn(turn_input) do
    run_validation(turn_input, @match_and_failure[:turn])
  end
  
  def validate_play_again(play_again_input) do
    run_validation(play_again_input, @match_and_failure[:play_again])
  end

  def run_validation(user_input, {accepted_input, failure}) do
    if String.match?(user_input, accepted_input) do
      {:ok, user_input}
    else
      {:error, failure}
    end
  end

end
