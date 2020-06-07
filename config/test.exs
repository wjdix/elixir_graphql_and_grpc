use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_graphql, ElixirGraphqlWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :elixir_grpc, ElixirGrpc.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "users_test",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
