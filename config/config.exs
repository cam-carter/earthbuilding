# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :earthbuilding,
  ecto_repos: [Earthbuilding.Repo]

# Configures the endpoint
config :earthbuilding, EarthbuildingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "HBhNIgu0LTNzL3/rsO3RFRRDuF+DEvVX0sGcObZ7iKuLuabZCmUZS+ZPOcnNP0wh",
  render_errors: [view: EarthbuildingWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Earthbuilding.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
