defmodule ElixirGrpc.Endpoint do
  @moduledoc false

  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(ElixirGrpc.User.Server)
end

defmodule ElixirGrpc.User.Server do
  @moduledoc false
  use GRPC.Server, service: ElixirGrpc.User.Service

  def create(request, _stream) do
    new_user =
      UserDB.add_user(%{
        first_name: request.first_name,
        last_name: request.last_name,
        age: request.age
      })

    ElixirGrpc.UserReply.new(new_user)
  end

  def get(request, _stream) do
    user = UserDB.get_user(request.id)

    cond do
      user == nil ->
        raise GRPC.RPCError, status: :not_found

      true ->
        ElixirGrpc.UserReply.new(user)
    end
  end
end
