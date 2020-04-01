defmodule ElixirGrpc.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_grpc,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirGrpc.Application, []}
    ]
  end

  defp deps do
    [
      {:grpc, "~> 0.5.0-beta"},
      {:cowlib, "~> 2.8.0", hex: :grpc_cowlib, override: true}
    ]
  end
end
