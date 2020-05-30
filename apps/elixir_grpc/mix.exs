defmodule ElixirGrpc.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixir_grpc,
      version: "0.1.0",
      elixir: "~> 1.10",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {ElixirGrpc.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:grpc, "~> 0.5.0-beta"},
      {:cowlib, "~>2.8.0", hex: :grpc_cowlib, override: true},
      {:uuid, "~> 1.1" },
      {:ecto, "~> 2.2.8" },
      {:postgrex, ">= 0.0.0" }
    ]
  end
end
