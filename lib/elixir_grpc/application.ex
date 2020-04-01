defmodule ElixirGrpc.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      UserDB,
      {GRPC.Server.Supervisor, {ElixirGrpc.Endpoint, 50051}}
    ]

    opts = [strategy: :one_for_one, name: ElixirGrpc.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
