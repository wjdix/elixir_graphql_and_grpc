defmodule ElixirGrpc.User do
  @moduledoc false
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :first_name, :string, null: false
    field :last_name, :string, null: false
    field :age, :integer, null: false

    timestamps()
  end

  def changeset(record, params \\ :empty) do
    record
    |> cast(params, [:first_name, :last_name, :age])
  end
end
