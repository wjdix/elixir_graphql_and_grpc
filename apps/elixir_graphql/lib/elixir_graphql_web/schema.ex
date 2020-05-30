defmodule ElixirGraphqlWeb.Schema do
  use Absinthe.Schema

  alias ElixirGraphqlWeb.Resolvers.Users

  object :user do
    field :id, non_null(:id)
    field :first_name, non_null(:string)
    field :last_name, non_null(:string)
    field :age, non_null(:integer)
  end

  query do
    field :user, :user do
      arg :id, non_null(:id)
      resolve &Users.find_user/3
    end
  end

  mutation do
    field :create_user, type: :user do
      arg :first_name, non_null(:string)
      arg :last_name, non_null(:string)
      arg :age, non_null(:integer)
      resolve &Users.create_user/3
    end
  end
end
