# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :rocketpay,
  ecto_repos: [Rocketpay.Repo]

# Configures the endpoint
config :rocketpay, RocketpayWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8Sm4ChwT3TExLGS7OoBQy+Mrpu04JpjFMOYrWbfE9SvPfHMt8pFZ6FK3XHcqVih7",
  render_errors: [view: RocketpayWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Rocketpay.PubSub,
  live_view: [signing_salt: "BoxF+LFG"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
