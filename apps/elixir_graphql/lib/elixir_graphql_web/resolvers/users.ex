defmodule ElixirGraphqlWeb.Resolvers.Users do
  def find_user(_parent, %{id: id}, _resolution) do
    {:ok, channel} = GRPC.Stub.connect("localhost:50051")
    request = ElixirGrpc.GetRequest.new(id: id)
    channel |> ElixirGrpc.User.Stub.get(request)
  end

  def create_user(_parent, args, _resolution) do
    {:ok, channel} = GRPC.Stub.connect("localhost:50051")
    request = ElixirGrpc.CreateRequest.new(
      first_name: args.first_name,
      last_name: args.last_name,
      age: args.age
    )
    channel |> ElixirGrpc.User.Stub.create(request)
  end
end
