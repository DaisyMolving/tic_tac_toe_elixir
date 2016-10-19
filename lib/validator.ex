defmodule TicTacToe.Validator do
  alias TicTacToe.Messager

  @match_and_failure %{
    :name => {~r/[a-z, A-Z]+/, Messager.name_input_failure},
    :marker => {~r/^(\D)$/, Messager.marker_input_failure},
    :turn => {~r/^([1-9])$/, Messager.turn_input_failure},
    :play_again => {~r/[yYnN]/, Messager.play_again_input_failure}
  }

  def validate_input(user_input, category) do
    run_validation(user_input, @match_and_failure[category])
  end

  def run_validation(user_input, {accepted_input, failure}) do
    if String.match?(user_input, accepted_input) do
      {:ok, user_input}
    else
      {:error, failure}
    end
  end

end
