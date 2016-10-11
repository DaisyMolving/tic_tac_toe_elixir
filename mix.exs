defmodule TicTacToe.Mixfile do
  use Mix.Project

  def project do
    [app: :tic_tac_toe,
     version: "0.1.0",
     elixir: "~> 1.3",
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test, "coveralls.html": :test],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:excoveralls, "~> 0.5", only: :test}
    ]
  end
end
