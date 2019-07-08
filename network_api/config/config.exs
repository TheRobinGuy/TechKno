# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :network_api,
  ecto_repos: [NetworkApi.Repo]

# Configures the endpoint
config :network_api, NetworkApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HjFlOLEay1rb8EBxBWocHV8DJy+6H2qhMiXr8ZvLbBUWAtYF26I0PEUXvj4He7cn",
  render_errors: [view: NetworkApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: NetworkApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
