defmodule ElixirGrpc.Endpoint do
  use GRPC.Endpoint

  intercept(GRPC.Logger.Server)
  run(ElixirGrpc.User.Server)
end

defmodule ElixirGrpc.User.Server do
  use GRPC.Server, service: ElixirGrpc.User.Service

  def create(request, _stream) do
    {:ok, new_user} =
      %ElixirGrpc.User{
        first_name: request.first_name,
        last_name: request.last_name,
        age: request.age
      }
      |> ElixirGrpc.Repo.insert()

    build_reply(new_user)
  end

  def get(request, _stream) do
    user =
      ElixirGrpc.User
      |> ElixirGrpc.Repo.get(request.id)

    if user == nil do
      raise GRPC.RPCError, status: :not_found
    else
      build_reply(user)
    end
  end

  def build_reply(user) do
    ElixirGrpc.UserReply.new(
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      age: user.age
    )
  end
end
