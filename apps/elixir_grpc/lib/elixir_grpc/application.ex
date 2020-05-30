defmodule ElixirGrpc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false
    children = [
      {GRPC.Server.Supervisor, {ElixirGrpc.Endpoint, 50_051}},
      supervisor(ElixirGrpc.Repo, []),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixirGrpc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
