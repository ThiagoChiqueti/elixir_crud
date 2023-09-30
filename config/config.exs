# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dwv,
  ecto_repos: [Dwv.Repo]

# Configures the endpoint
config :dwv, DwvWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "IUPMgWd5PvRbXJD0oDK7IfqSWzXtRMaI1S0BkBmBsWY0GyUC14dzmh30HgKtbVD7",
  render_errors: [view: DwvWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Dwv.PubSub,
  live_view: [signing_salt: "OAIff6Xr"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
