defmodule ElixirGraphqlWeb.Router do
  use ElixirGraphqlWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ElixirGraphqlWeb.Schema,
      interface: :simple,
      context: %{pubsub: ElixirGraphqlWeb.Endpoint}
  end

end
