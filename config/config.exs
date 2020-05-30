# General application configuration
use Mix.Config

# Configures the endpoint
config :elixir_graphql, ElixirGraphqlWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tKGNPJW/RDDAOWcw12f9gCRyO0PZS2IJnRGMIomLVGu7m9kqOvI9emFPC2LPwi98",
  render_errors: [view: ElixirGraphqlWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ElixirGraphql.PubSub,
  live_view: [signing_salt: "Gm1PWkxK"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :elixir_grpc, :grpc, start_server: true

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#
