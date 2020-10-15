# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ecozhop,
  ecto_repos: [Ecozhop.Repo]

# Configures the endpoint
config :ecozhop, EcozhopWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "XcVlDNXCrLjfZR1pzVu9Jv0PjFLe5Kij5G1VP9YhKnxSBUvK3cSEQSLFpzuYYZdP",
  render_errors: [view: EcozhopWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Ecozhop.PubSub,
  live_view: [signing_salt: "PL0ygSMP"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :ecozhop, EcozhopWeb.Auth.Guardian,
  issuer: "echozhop",
  secret_key: "x4uHuWirORxGVAzwUdaugTm/kCqOvHRLlC9ARz60rhsvBq+vL6ztx0beXWQbWEyP"
