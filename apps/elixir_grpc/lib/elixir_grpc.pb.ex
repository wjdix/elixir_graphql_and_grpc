defmodule ElixirGrpc.UserReply do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t(),
          first_name: String.t(),
          last_name: String.t(),
          age: integer
        }
  defstruct [:id, :first_name, :last_name, :age]

  field(:id, 1, type: :string)
  field(:first_name, 2, type: :string)
  field(:last_name, 3, type: :string)
  field(:age, 4, type: :int32)
end

defmodule ElixirGrpc.CreateRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          first_name: String.t(),
          last_name: String.t(),
          age: integer
        }
  defstruct [:first_name, :last_name, :age]

  field(:first_name, 1, type: :string)
  field(:last_name, 2, type: :string)
  field(:age, 3, type: :int32)
end

defmodule ElixirGrpc.GetRequest do
  @moduledoc false
  use Protobuf, syntax: :proto3

  @type t :: %__MODULE__{
          id: String.t()
        }
  defstruct [:id]

  field(:id, 1, type: :string)
end

defmodule ElixirGrpc.User.Service do
  @moduledoc false
  use GRPC.Service, name: "elixir_grpc.User"

  rpc(:Create, ElixirGrpc.CreateRequest, ElixirGrpc.UserReply)
  rpc(:Get, ElixirGrpc.GetRequest, ElixirGrpc.UserReply)
end

defmodule ElixirGrpc.User.Stub do
  @moduledoc false
  use GRPC.Stub, service: ElixirGrpc.User.Service
end
