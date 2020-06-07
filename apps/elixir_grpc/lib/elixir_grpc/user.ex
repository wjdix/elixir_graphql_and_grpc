defmodule ElixirGrpc.User do
  @moduledoc false
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field(:first_name, :string, null: false)
    field(:last_name, :string, null: false)
    field(:age, :integer, null: false)

    timestamps()
  end

  def create_changeset(user, params \\ %{}) do
    user
    |> Ecto.Changeset.cast(params, [:first_name, :last_name, :age])
    |> Ecto.Changeset.validate_required([:first_name, :last_name, :age])
  end
end
