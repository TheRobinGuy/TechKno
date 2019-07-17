# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :nodes_api,
  ecto_repos: [NodesApi.Repo]

# Configures the endpoint
config :nodes_api, NodesApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WQHv0guO2d5M3b60M4F6GGq8MAfDeJw5V3ptTaMDfvbX3gxWtykSIsydesypPjMx",
  render_errors: [view: NodesApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: NodesApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
